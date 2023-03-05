import 'dart:io';

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
    on<MeetingJoinRoomEvent>(_onJoinRoom);
    on<MeetingExitRoomEvent>(_onExitRoom);
    on<MeetingOccurErrorEvent>(_onOccurError);
    on<MeetingParticipantJoinedEvent>(_onParticipantJoined);
    on<MeetingParticipantLeftEvent>(_onParticipantLeft);
  }

  late final SessionScheduleEntity session;
  final CreateEventTrackingUseCase createEventTrackingUseCase =
      CreateEventTrackingUseCase(
    eventTrackingRepository: getIt.get<EventTrackingRepository>(),
  );

  void _onInit(MeetingInitEvent event, emit) async {
    session = event.session;

    var featureFlags = <FeatureFlag, bool>{
      FeatureFlag.isWelcomePageEnabled: false,
      FeatureFlag.isAddPeopleEnabled: false,
    };

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlag.isCallIntegrationEnabled] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlag.isPipEnabled] = false;
      }
    }

    var options = JitsiMeetingOptions(
      roomNameOrUrl: event.session.sessionId!,
      serverUrl: 'https://meet.jit.si/',
      subject:
          'Meeting room of ${event.session.sessionStudent?.fullName ?? 'student'} and ${event.session.sessionTeacher?.fullName ?? 'teacher'}',
      userDisplayName: event.session.sessionStudent?.fullName ?? 'Student',
      isAudioMuted: true,
      isVideoMuted: true,
      featureFlags: featureFlags,
    );

    var listeners = JitsiMeetingListener(
      onConferenceJoined: (url) async {
        add(const MeetingJoinRoomEvent());
      },
      onClosed: () async {
        add(const MeetingExitRoomEvent());
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

    await JitsiMeetWrapper.joinMeeting(options: options, listener: listeners);
  }

  void _onJoinRoom(MeetingJoinRoomEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId!,
        event:
            'Student ${session.sessionStudent?.fullName ?? 'unknown name'} joined room.',
      ),
    );
  }

  void _onExitRoom(MeetingExitRoomEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId!,
        event:
            'Student ${session.sessionStudent?.fullName ?? 'unknown name'} exited room.',
      ),
    );
    emit(const MeetingEndState());
  }

  void _onOccurError(MeetingOccurErrorEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId!,
        event:
            'Occur error in Student ${session.sessionStudent?.fullName ?? 'unknown name'}.',
      ),
    );
  }

  void _onParticipantJoined(MeetingParticipantJoinedEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId!,
        event:
            'Teacher ${session.sessionTeacher?.fullName ?? 'unknown name'} joined room.',
      ),
    );
  }

  void _onParticipantLeft(MeetingParticipantLeftEvent event, emit) async {
    final result = await createEventTrackingUseCase.execute(
      CreateEventTrackingParams(
        sessionId: session.sessionId!,
        event:
            'Teacher ${session.sessionTeacher?.fullName ?? 'unknown name'} exited room.',
      ),
    );
  }
}
