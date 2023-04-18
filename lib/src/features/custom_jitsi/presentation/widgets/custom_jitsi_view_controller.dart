import 'package:flutter/services.dart';
import 'package:jitsi_meet_wrapper_platform_interface/jitsi_meet_wrapper_platform_interface.dart';

import '../../../../shared/constants.dart';

class CustomJitsiViewController {
  CustomJitsiViewController({
    required int id,
    JitsiMeetingListener? listener,
  })  : _channel = MethodChannel('${ChannelConstants.methodChannelName}_$id'),
        _listener = listener;

  final MethodChannel _channel;
  final EventChannel _eventChannel =
      EventChannel(ChannelConstants.methodChannelName);
  JitsiMeetingListener? _listener;

  Future<void> join() async {
    await _channel.invokeMethod('join');
  }

  Future<void> hangUp() async {
    await _channel.invokeMethod('hangUp');
  }

  Future<void> setAudioMuted(bool isMuted) async {
    await _channel.invokeMethod(
      'setAudioMuted',
      {
        'isMuted': isMuted,
      },
    );
  }

  Future<void> attachListener(JitsiMeetingListener listener) async {
    await JitsiMeetWrapperPlatformInterface.instance.attachListener(listener);
  }
}
