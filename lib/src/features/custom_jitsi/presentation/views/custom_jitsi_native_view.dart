import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

import '../../../../shared/constants.dart';
import '../widgets/custom_jitsi_view_controller.dart';

typedef CustomJitsiNativeViewCreatedCallback = void Function(
    CustomJitsiViewController controller);

class CustomJitsiNativeView extends StatelessWidget {
  const CustomJitsiNativeView({
    super.key,
    required this.onViewCreated,
    required this.options,
  });

  final CustomJitsiNativeViewCreatedCallback onViewCreated;
  final JitsiMeetingOptions options;

  @override
  Widget build(BuildContext context) {
    final viewType = ChannelConstants.methodChannelName;

    return UiKitView(
      viewType: viewType,
      creationParams: options.toMap(),
      layoutDirection: TextDirection.ltr,
      creationParamsCodec: const StandardMessageCodec(),
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }

  void _onPlatformViewCreated(int id) => onViewCreated(
        CustomJitsiViewController(
          id: id,
        ),
      );
}
