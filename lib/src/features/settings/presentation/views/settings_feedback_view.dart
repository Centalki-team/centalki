import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../gen/assets.gen.dart';

class SettingsFeedbackView extends StatefulWidget {
  const SettingsFeedbackView({super.key});

  @override
  State<SettingsFeedbackView> createState() => _SettingsFeedbackViewState();
}

class _SettingsFeedbackViewState extends State<SettingsFeedbackView> {
  double ratingValue = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
                AppText.txtGiveFeedback,
                style: TextStyle(
                  fontSize: 22.0,
                  height: 28.0,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0),
                child: Text(
                  AppText.txtRateOurApp,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 24.0 / 16.0,
                    letterSpacing: 0.15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    empty: Assets.icon.icRatingStar.svg(),
                    half: Assets.icon.icRatingStarSelected.svg(),
                    full: Assets.icon.icRatingStarSelected.svg(),
                  ),
                  onRatingUpdate: (value) => ratingValue = value,
                  itemPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28.0),
                child: Text(
                  AppText.txtPleaseTellUsWatUThink,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 24.0 / 16.0,
                    letterSpacing: 0.15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: AppOutlinedTextField(
                  controller: _controller,
                  labelText: AppText.txtPleaseTellUsWatUThink,
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Container(
                    height: 40.0,
                    margin: const EdgeInsets.only(
                      right: 16.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: const Color(0xFF1760A5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icon.icSend.svg(),
                        const SizedBox(
                          width: 4.0,
                        ),
                        const Text(
                          AppText.txtSend,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
