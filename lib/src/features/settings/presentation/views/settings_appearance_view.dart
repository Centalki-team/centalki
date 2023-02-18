import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
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
              color: Color(0xFF43474E),
            ),
          ),
          title: Row(children: const [
            Text(
              AppText.txtAppearance,
              style: TextStyle(
                fontSize: 22.0,
                height: 28.0,
                color: Color(0xFF1A1C1E),
              ),
            ),
          ]),
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
                  height: 4.0,
                ),
                Text(
                  AppText.txtApplicationTheme,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtDarkMode,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
