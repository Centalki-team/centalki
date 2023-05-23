import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../../session_feedback/presentation/views/session_completed_view.dart';

class HangUpMeetingView extends StatefulWidget {
  const HangUpMeetingView({Key? key}) : super(key: key);

  @override
  State<HangUpMeetingView> createState() => _HangUpMeetingViewState();
}

class _HangUpMeetingViewState extends State<HangUpMeetingView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SessionScheduleEntity;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        //backgroundColor: AppColor.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
              padding24, padding48 + padding12, padding24, padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.illustration.afterHangUp.path,
                width: width / 2,
                height: width / 2,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: spacing24),
              const Text(
                TextDoc.txtRejoinDesc,
                style: TextStyle(
                  fontSize: bodySmallSize,
                  fontWeight: bodySmallWeight,
                  color: AppColor.shadow,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: spacing12),
              AppFilledButton(
                text: TextDoc.txtRejoin,
                onPressed: () {
                  Navigator.pop(context, true);
                },
                minimumSize: Size(width / 2, 48),
              ),
              const Spacer(),
              const Text(
                TextDoc.txtDoneDesc,
                style: TextStyle(
                  fontSize: bodySmallSize,
                  fontWeight: bodySmallWeight,
                  color: AppColor.shadow,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: spacing12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SessionCompletedView(),
                      settings: RouteSettings(arguments: ScreenArguments(args.sessionTeacher?.id ?? "", args.sessionId)),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: AppColor.support,
                  shadowColor: AppColor.shadow.shade200,
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text(
                  TextDoc.txtDone,
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: labelLargeSize,
                    fontWeight: labelLargeWeight,
                    color: AppColor.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
