import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../gen/assets.gen.dart';
import '../widgets/content_row.dart';
import 'settings_about_view.dart';
import 'settings_appearance_view.dart';
import 'settings_feedback_view.dart';
import 'settings_language_view.dart';
import 'settings_notification_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContentRow(
                icon: Assets.icon.icNoti,
                title: AppText.txtNotification,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsNotification(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContentRow(
                icon: Assets.icon.icPaintPalette,
                title: AppText.txtAppearance,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsAppearance(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContentRow(
                icon: Assets.icon.icLanguage,
                title: AppText.txtLanguage,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsLanguage(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContentRow(
                icon: Assets.icon.icFeedback,
                title: AppText.txtGiveFeedback,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsFeedbackView(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContentRow(
                icon: Assets.icon.icWarning,
                title: AppText.txtAbout,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsAboutView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
