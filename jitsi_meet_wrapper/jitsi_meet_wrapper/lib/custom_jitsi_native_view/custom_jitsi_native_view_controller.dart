import 'package:flutter/services.dart';
import 'package:jitsi_meet_wrapper_platform_interface/jitsi_meet_wrapper_platform_interface.dart';

class CustomJitsiNativeViewController {
  CustomJitsiNativeViewController({
    required int id,
    JitsiMeetingListener? listener,
  })  : _methodChannel = MethodChannel(
            "plugins.jitsi_meet_wrapper/custom_jitsi_meet_native_view_$id"),
        _listener = listener;

  final MethodChannel _methodChannel;
  final EventChannel _eventChannel =
      const EventChannel("plugins.jitsi_meet_wrapper:custom_jitsi_native_view");
  JitsiMeetingListener? _listener;

  Future<void> join() async {
    await _methodChannel.invokeMethod('join');
  }

  Future<void> hangUp() async {
    await _methodChannel.invokeMethod('hangUp');
  }

  Future<void> setAudioMuted(bool isMuted) async {
    await _methodChannel.invokeMethod('setAudioMuted', {"isMuted": isMuted});
  }

  Future<void> attachListener(JitsiMeetingListener listener) async {
    await JitsiMeetWrapperPlatformInterface.instance.attachListener(listener);
  }
}
