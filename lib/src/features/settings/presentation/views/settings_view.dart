import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../base/define/common_txt_style.dart';
import '../../../../../base/define/styles.dart';
import '../widgets/setting_tile.dart';
import 'settings_about_view.dart';
import 'settings_appearance_view.dart';
import 'settings_feedback/settings_feedback_page.dart';
import 'settings_language_view.dart';
import 'settings_notification_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            height: 64.0,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 4.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppText.appName,
                    style: CommonTxtStyle.t30Regular.apply(
                      color: AppColor.defaultFont,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 24.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12.0,
                //   ),
                //   child: Assets.icon.icSearchHeader.svg(),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 12.0,
                //   ),
                //   child: Assets.icon.icNotiHeader.svg(),
                // ),
              ],
            ),
          ),
          SingleChildScrollView(
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
                        builder: (context) => const SettingsFeedbackPage(),
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
          ),
        ],
      );
}
