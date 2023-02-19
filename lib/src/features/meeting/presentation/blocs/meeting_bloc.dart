import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(const MeetingInitState()) {
    on<MeetingInitEvent>(_onInit);
    add(const MeetingInitEvent());
  }

  void _onInit(MeetingInitEvent event, emit) async {
    var featureFlags = <FeatureFlagEnum, bool>{
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
    };

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }

    var options = JitsiMeetingOptions(room: 'jsdfhnu394921ni92341njsd')
      ..serverURL = 'https://meet.jit.si/'
      ..subject = 'Meeting room of A and B'
      ..audioMuted = true
      ..videoMuted = true
      ..featureFlags = featureFlags;

    await JitsiMeet.joinMeeting(options);
  }
}
