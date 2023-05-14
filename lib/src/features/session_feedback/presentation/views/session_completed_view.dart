import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/elevated_button.dart';
import '../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../report_meeting/presentation/views/report_meeting_page.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';
import 'session_give_feedback/session_give_feedback_page.dart';

class SessionCompletedView extends StatelessWidget {
  const SessionCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          padding16,
          MediaQuery.of(context).padding.top + kToolbarHeight + spacing56,
          padding16,
          46,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.illustration.congrats.svg(
              height: 160,
              width: 160,
            ),
            const SizedBox(height: spacing24),
            const Text(
              TextDoc.txtCongrats,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.support,
                fontSize: headlineLargeSize,
                fontWeight: headlineLargeWeight,
              ),
            ),
            const Text(
              TextDoc.txtSessionCompletedBody,
              style: TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                letterSpacing: 0.5,
                height: 24 / 16,
                color: AppColor.defaultFont,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              TextDoc.txtSessionCompletedAskForFeedback,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.25,
                letterSpacing: 0.5,
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                color: AppColor.shadow,
              ),
            ),
            const SizedBox(
              height: spacing8,
            ),
            AppElevatedButton(
              text: TextDoc.txtSessionCompletedFeedbackBtn,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const SessionGiveFeedbackPage(),
                    settings: RouteSettings(arguments: args)),
              ),
            ),
            AppTextButton(
              onPressed: () => {
                Navigator.pop(context),
                Navigator.pop(context),
              },
              text: TextDoc.txtDoItLater,
            ),
            const SizedBox(
              height: spacing16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  TextDoc.txtSessionCompletedAskForReport,
                  style: TextStyle(
                    fontSize: bodyMediumSize,
                    fontWeight: bodyMediumWeight,
                    color: AppColor.shadow,
                  ),
                ),
                AppTextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ReportMeetingPage(),
                        settings: RouteSettings(arguments: args)),
                  ),
                  text: TextDoc.txtSessionCompletedReportBtn,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
