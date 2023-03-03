import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../widgets/setting_tile.dart';
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
              SettingTile(
                icon: Icons.notifications_outlined,
                title: TextDoc.txtNotification,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsNotification(),
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              SettingTile(
                icon: Icons.brush_outlined,
                title: TextDoc.txtAppearance,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsAppearance(),
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              SettingTile(
                icon: Icons.language_outlined,
                title: TextDoc.txtLanguage,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsLanguage(),
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              SettingTile(
                icon: Icons.feedback_outlined,
                title: TextDoc.txtGiveFeedback,
                onClick: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsFeedbackView(),
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              SettingTile(
                icon: Icons.info_outline,
                title: TextDoc.txtAbout,
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
