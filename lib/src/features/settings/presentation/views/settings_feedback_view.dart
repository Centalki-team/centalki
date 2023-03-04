import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';
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
                TextDoc.txtGiveFeedback,
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
          padding: const EdgeInsets.symmetric(horizontal: padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: spacing8
              ),
              const Text(
                TextDoc.txtRateOurApp,
                style: TextStyle(
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              const SizedBox(height: spacing16),
              Center(
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    empty: const Icon(
                      Icons.star,
                      color: AppColor.background,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: AppColor.mainColor2,
                    ),
                    full: const Icon(
                      Icons.star,
                      color: AppColor.mainColor2,
                    ),
                  ),
                  onRatingUpdate: (value) => ratingValue = value,
                  itemPadding: const EdgeInsets.symmetric(
                    horizontal: padding12,
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              const Text(
                TextDoc.txtPleaseTellUsWatUThink,
                style: TextStyle(
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              const SizedBox(height: spacing8),
              AppOutlinedTextField(
                controller: _controller,
                maxLines: 3,
              ),
              const SizedBox(height: spacing32),
              AppFilledButton(
                text: TextDoc.txtSend,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
