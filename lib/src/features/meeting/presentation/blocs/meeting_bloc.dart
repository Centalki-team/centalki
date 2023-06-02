import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

import '../../../../../di/di_module.dart';
import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../../domain/usecases/create_event_tracking_params.dart';
import '../../domain/usecases/create_event_tracking_usecase.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(const MeetingInitState()) {
    on<MeetingInitEvent>(_onInit);
    on<MeetingLoadEvent>(_onLoad);
    on<MeetingJoinRoomEvent>(_onJoinRoom);
    on<MeetingExitRoomEvent>(_onExitRoom);
    on<MeetingOccurErrorEvent>(_onOccurError);
    on<MeetingParticipantJoinedEvent>(_onParticipantJoined);
    on<MeetingParticipantLeftEvent>(_onParticipantLeft);
  }

  SessionScheduleEntity session = const SessionScheduleEntity(sessionId: "");
  late DatabaseReference statusSessionRef;
  final CreateEventTrackingUseCase createEventTrackingUseCase =
      CreateEventTrackingUseCase(
    eventTrackingRepository: getIt.get<EventTrackingRepository>(),
  );
  var notCompleted = true;
  final serverURL = "https://meet.centalki.com/";

  @override
  Future<void> close() {
    statusSessionRef.onValue.listen((event) {}).cancel();
    return super.close();
  }

  void _onInit(MeetingInitEvent event, emit) async {
    session = event.session;
    statusSessionRef = FirebaseDatabase.instance
        .ref("session-schedule/${session.sessionId}/status");
    final events = statusSessionRef.onValue;
    var currentStatus = '';
    await for (var e in events) {
      currentStatus = e.snapshot.value.toString();
      switch (currentStatus) {
        case 'PICKED_UP':
          notCompleted = true;
          add(const MeetingLoadEvent());
          break;
        case 'COMPLETED':
        case 'CANCELLED':
          notCompleted = false;
          JitsiMeetWrapper.hangUp();
          add(MeetingExitRoomEvent(notCompleted: notCompleted));
          break;
      }
    }
  }

  void _onLoad(MeetingLoadEvent event, emit) async {
    var featureFlags = <FeatureFlag, Object?>{
      FeatureFlag.isWelcomePageEnabled: false,
      FeatureFlag.isAddPeopleEnabled: false,
      FeatureFlag.isPrejoinPageEnabled: false,
    };

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlag.isCallIntegrationEnabled] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlag.isPipEnabled] = false;
      }
    }

    var configOverrides = {
      "hideEmailInSettings": true,
      "hiddenPremeetingButtons": ['invite'],
      "toolbarButtons": [
        'camera',
        'chat',
        'desktop',
        'fullscreen',
        'hangup',
        'help',
        'microphone',
        'participants-pane',
        'raisehand',
        'recording',
        'select-background',
        'whiteboard',
      ],
      "disableInviteFunctions": true,
      "remoteVideoMenu": {
        "disableKick": true,
      },
      "breakoutRooms": {
        "hideAddRoomButton": true,
      },
      "welcomePage": {
        "disabled": true,
      },
      "enableClosePage": false,
      "defaultLocalDisplayName": session.sessionStudent?.fullName ?? 'Student',
      "defaultRemoteDisplayName": session.sessionStudent?.fullName ?? 'Student',
    };

    var options = JitsiMeetingOptions(roomNameOrUrl: '');
    if (session.sessionStudent?.avatarURL != null) {
      options = JitsiMeetingOptions(
        roomNameOrUrl: session.sessionId,
        serverUrl: serverURL,
        subject:
            'Meeting room of ${session.sessionStudent?.fullName ?? 'student'} and ${session.sessionTeacher?.fullName ?? 'teacher'}',
        userDisplayName: session.sessionStudent?.fullName ?? 'Student',
        userAvatarUrl: session.sessionStudent?.avatarURL!,
        isAudioMuted: true,
        isVideoMuted: true,
        featureFlags: featureFlags,
        configOverrides: configOverrides,
      );
    } else {
      options = JitsiMeetingOptions(
        roomNameOrUrl: session.sessionId,
        serverUrl: serverURL,
        subject:
            'Meeting room of ${session.sessionStudent?.fullName ?? 'student'} and ${session.sessionTeacher?.fullName ?? 'teacher'}',
        userDisplayName: session.sessionStudent?.fullName ?? 'Student',
        isAudioMuted: true,
        isVideoMuted: true,
        featureFlags: featureFlags,
        configOverrides: configOverrides,
      );
    }

    var listeners = JitsiMeetingListener(
      onConferenceJoined: (url) async {
        add(const MeetingJoinRoomEvent());
      },
      onClosed: () async {
        add(MeetingExitRoomEvent(notCompleted: notCompleted));
      },
      onConferenceTerminated: (url, error) async {
        add(const MeetingOccurErrorEvent());
      },
      onParticipantJoined: (email, name, role, participantId) async {
        add(const MeetingParticipantJoinedEvent());
      },
      onParticipantLeft: (participantId) async {
        add(const MeetingParticipantLeftEvent());
      },
    );

    if (Platform.isAndroid) {
      await JitsiMeetWrapper.joinMeeting(options: options, listener: listeners);
      emit(const MeetingInitAndroidState());
    } else if (Platform.isIOS) {
      emit(MeetingInitIosState(
        options: options,
        listeners: listeners,
      ));
    }
  }

  void _onJoinRoom(MeetingJoinRoomEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId,
        event:
            'Student ${session.sessionStudent?.fullName ?? 'unknown name'} joined room.',
      ),
    );
  }

  void _onExitRoom(MeetingExitRoomEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId,
        event:
            'Student ${session.sessionStudent?.fullName ?? 'unknown name'} exited room.',
      ),
    );
    emit(MeetingEndState(session: session, notCompleted: event.notCompleted));
  }

  void _onOccurError(MeetingOccurErrorEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId,
        event:
            'Occur error in Student ${session.sessionStudent?.fullName ?? 'unknown name'}.',
      ),
    );
  }

  void _onParticipantJoined(MeetingParticipantJoinedEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId,
        event:
            'Teacher ${session.sessionTeacher?.fullName ?? 'unknown name'} joined room.',
      ),
    );
  }

  void _onParticipantLeft(MeetingParticipantLeftEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId,
        event:
            'Teacher ${session.sessionTeacher?.fullName ?? 'unknown name'} exited room.',
      ),
    );
  }
}
