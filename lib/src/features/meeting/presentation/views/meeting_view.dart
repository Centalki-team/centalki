import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/theme.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../../session_feedback/presentation/views/session_completed_view.dart';
import '../blocs/meeting_bloc.dart';
import 'hang_up_meeting_view.dart';
import 'jitsi_native_view_test.dart';
import 'meeting_android_view.dart';

class MeetingView extends StatefulWidget {
  const MeetingView({Key? key}) : super(key: key);

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  late bool allowPop;

  @override
  void initState() {
    super.initState();
    allowPop = false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(allowPop),
        child: Scaffold(
          backgroundColor: colorsByTheme(context).backgroundTheme,
          body: SafeArea(
            child: BlocConsumer<MeetingBloc, MeetingState>(
              listener: (context, state) async {
                if (state is MeetingEndState) {
                  var rejoin = false;
                  if (state.notCompleted) {
                    rejoin = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HangUpMeetingView(),
                                settings: RouteSettings(
                                  arguments: state.session,
                                ))) ??
                        false;
                    if (mounted) {
                      if (rejoin) {
                        context.read<MeetingBloc>().add(
                              MeetingInitEvent(session: state.session),
                            );
                      } else {
                        allowPop = true;
                        Navigator.pop(context);
                      }
                    }
                  } else {
                    allowPop = true;
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SessionCompletedView(),
                        settings: RouteSettings(
                          arguments: ScreenArguments(state.session.sessionTeacher?.id ?? "", state.session.sessionId),
                        ),
                      ),
                    );
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  }
                }
              },
              buildWhen: (previous, current) => current is MeetingInitIosState || current is MeetingInitAndroidState,
              builder: (context, state) {
                if (state is MeetingInitIosState) {
                  return JitsiNativeViewTest(
                    key: UniqueKey(),
                    options: state.options,
                    listener: state.listeners,
                  );
                } else if (state is MeetingInitAndroidState) {
                  return const MeetingAndroidView();
                }
                return const Center();
              },
            ),
          ),
        ),
      );
}
