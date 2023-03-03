import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../widgets/setting_switch_row.dart';

class SettingsAppearance extends StatelessWidget {
  const SettingsAppearance({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFDFCFF),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.defaultFont,
            ),
          ),
          title: Row(
            children: const [
              Text(
                TextDoc.txtAppearance,
                style: TextStyle(
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
              children: const [
                SizedBox(
                  height: spacing4,
                ),
                Text(
                  TextDoc.txtApplicationTheme,
                  style: TextStyle(
                    fontSize: titleMediumSize,
                    fontWeight: titleMediumWeight,
                    color: AppColor.defaultFont,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: TextDoc.txtDarkMode,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
