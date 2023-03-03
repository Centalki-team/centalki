import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../widgets/vertical_radio_group.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

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
            children: const [
              Text(
                TextDoc.txtLanguage,
                style: TextStyle(
                  fontSize: headlineSmallSize,
                  fontWeight: headlineSmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: VerticalRadioGroup(
            initValue: TextDoc.txtEnglish,
            dataList: [
              TextDoc.txtEnglish,
              TextDoc.txtVietnamese,
            ],
          ),
        ),
      );
}
