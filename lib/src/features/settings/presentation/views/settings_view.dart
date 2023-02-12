import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../widgets/content_row.dart';
import 'settings_appearance_view.dart';
import 'settings_language_view.dart';
import 'settings_notification_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 24.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Centalki',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w600,
                  height: 44.0,
                ),
              ),
              GestureDetector(
                child: Assets.icon.icNotiHeader.svg(),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
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
                  title: 'Notification',
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
                  title: 'Appearance',
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
                  title: 'Language',
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
                  title: 'Give Feedback',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ContentRow(
                  icon: Assets.icon.icWarning,
                  title: 'About',
                ),
              ],
            ),
          ),
        ),
      );
}
