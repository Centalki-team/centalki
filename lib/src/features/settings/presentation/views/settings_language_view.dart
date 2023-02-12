import 'package:flutter/material.dart';

import '../widgets/vertical_radio_group.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

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
          title: Row(
            children: const [
              Text(
                'Language',
                style: TextStyle(
                  fontSize: 22.0,
                  height: 28.0,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: VerticalRadioGroup(
            initValue: 'English',
            dataList: [
              'English',
              'Tiếng Việt',
            ],
          ),
        ),
      );
}
