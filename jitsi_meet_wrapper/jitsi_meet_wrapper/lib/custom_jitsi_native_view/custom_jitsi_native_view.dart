import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

typedef CustomJitsiNativeViewCreatedCallback = void Function(
    CustomJitsiNativeViewController);

class CustomJitsiNativeView extends StatelessWidget {
  const CustomJitsiNativeView({
    Key? key,
    required this.onViewCreated,
    required this.options,
  }) : super(
          key: key,
        );

  final CustomJitsiNativeViewCreatedCallback onViewCreated;
  final JitsiMeetingOptions options;

  @override
  Widget build(BuildContext context) {
    const String viewType =
        "plugins.jitsi_meet_wrapper:custom_jitsi_native_view";

    return UiKitView(
      viewType: viewType,
      creationParams: options.toMap(),
      layoutDirection: TextDirection.ltr,
      creationParamsCodec: const StandardMessageCodec(),
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }

  void _onPlatformViewCreated(int id) =>
      onViewCreated(CustomJitsiNativeViewController(
        id: id,
      ));
}
