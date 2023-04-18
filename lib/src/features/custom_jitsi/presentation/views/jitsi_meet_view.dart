import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

import '../widgets/custom_jitsi_view_controller.dart';
import 'custom_jitsi_native_view.dart';

class JitsiMeetView extends StatefulWidget {
  const JitsiMeetView({
    super.key,
    required this.options,
    required this.listener,
  });

  final JitsiMeetingOptions options;
  final JitsiMeetingListener listener;

  @override
  State<JitsiMeetView> createState() => _JitsiMeetViewState();
}

class _JitsiMeetViewState extends State<JitsiMeetView> {
  CustomJitsiViewController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Jitsi meet widget'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller?.join();
                },
                child: const Text('Join'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller?.hangUp();
                },
                child: const Text('hangup'),
              ),
              SizedBox(
                height: 500,
                width: 400,
                child: CustomJitsiNativeView(
                  options: widget.options,
                  onViewCreated: (controller) {
                    _controller = controller;
                    _controller?.attachListener(widget.listener);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
