import 'package:flutter/material.dart';

import '../../../../../base/define/common_txt_style.dart';
import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';
import '../../../notifications/presentation/views/noti_list_page.dart';
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
                    S.current.appName,
                    style: CommonTxtStyle.t30Regular.apply(
                      color: colorsByTheme(context).defaultFont,
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
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotiListPage(),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      color: AppColor.mainColor1,
                    ),
                  ),
                ),
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
                    title: S.current.txtNotification,
                    onClick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsNotification(),
                      ),
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  SettingTile(
                    icon: Icons.brush_outlined,
                    title: S.current.txtAppearance,
                    onClick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsAppearance(),
                      ),
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  SettingTile(
                    icon: Icons.language_outlined,
                    title: S.current.txtLanguage,
                    onClick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsLanguage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  SettingTile(
                    icon: Icons.feedback_outlined,
                    title: S.current.txtGiveFeedback,
                    onClick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsFeedbackPage(),
                      ),
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  SettingTile(
                    icon: Icons.info_outline,
                    title: S.current.txtAbout,
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
