import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/setting_switch_row.dart';

class SettingsNotification extends StatelessWidget {
  const SettingsNotification({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.defaultFont,
            ),
          ),
          title: Row(
            children: [
              Text(
                S.current.txtNotification,
                style: const TextStyle(
                  fontSize: headlineSmallSize,
                  fontWeight: headlineSmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: spacing4),
                Text(
                  S.current.txtNotifyMeAbout,
                  style: const TextStyle(
                    fontSize: titleMediumSize,
                    fontWeight: titleMediumWeight,
                    color: AppColor.defaultFont,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: S.current.txtDealsAndDiscounts,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: S.current.txtNewTopics,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: S.current.txtNewTeachers,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFCAC4D0),
                    ),
                    child: SizedBox(
                      height: 1.0,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: S.current.txtSounds,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: S.current.txtVibrations,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
