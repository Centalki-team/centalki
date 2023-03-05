import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(const MeetingInitState()) {
    on<MeetingInitEvent>(_onInit);
  }

  void _onInit(MeetingInitEvent event, emit) async {
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
      roomNameOrUrl: 'jsdfhnu394921ni92341njsd',
      serverUrl: 'https://meet.jit.si/',
      subject: 'Meeting room of A and B',
      isAudioMuted: true,
      isVideoMuted: true,
      featureFlags: featureFlags,
    );

    await JitsiMeetWrapper.joinMeeting(options: options);
  }
}
