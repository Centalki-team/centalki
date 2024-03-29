import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/settings_feedback_bloc/settings_feedback_bloc.dart';

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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Icon(
            Icons.arrow_back,
            color: colorsByTheme(context).defaultFont,
          ),
        ),
        title: Row(
          children: [
            Text(
              S.current.txtGiveFeedback,
              style: TextStyle(
                fontSize: headlineSmallSize,
                fontWeight: headlineSmallWeight,
                color: colorsByTheme(context).defaultFont,
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<SettingsFeedbackBloc, SettingsFeedbackState>(
        listener: (context, state) {
          if (state is SettingsFeedbackLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context, loading: false);
            if (state is SettingsFeedbackLoadDoneState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: colorsByTheme(context).backgroundCardsChip,
                  title: Text(
                    S.current.txtSuccess,
                    style: TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  content: Text(
                    S.current.txtSuccessFeedback,
                    style: TextStyle(
                      fontSize: bodyMediumSize,
                      fontWeight: bodyMediumWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  actions: [
                    AppTextButton(
                      text: S.current.txtOk,
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                    )
                  ],
                ),
              );
            } else if (state is SettingsFeedbackLoadErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: colorsByTheme(context).backgroundCardsChip,
                  title: Text(
                    S.current.txtLoadFail,
                    style: TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  content: Text(
                    state.exception.message,
                    style: TextStyle(
                      fontSize: bodyMediumSize,
                      fontWeight: bodyMediumWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  actions: [
                    AppTextButton(
                      text: S.current.txtOk,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            }
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: spacing8),
              Text(
                S.current.txtRateOurApp,
                style: TextStyle(
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                  color: colorsByTheme(context).defaultFont,
                ),
              ),
              const SizedBox(height: spacing16),
              Center(
                child: BlocBuilder<SettingsFeedbackBloc, SettingsFeedbackState>(
                  builder: (context, state) => Column(
                    children: [
                      RatingBar(
                        itemSize: (width - padding48) / 9,
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
                        onRatingUpdate: (value) {
                          ratingValue = value;
                          context.read<SettingsFeedbackBloc>().add(
                              SettingsFeedbackValidateEvent(
                                  rating: ratingValue,
                                  feedback: _controller.text));
                        },
                        itemPadding: EdgeInsets.symmetric(
                          horizontal: (width - padding48) / 27,
                        ),
                      ),
                      (state is SettingsFeedbackValidateState &&
                              state.ratingError.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.ratingError,
                                style: const TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.error,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: spacing16),
              Text(
                S.current.txtPleaseTellUsWatUThink,
                style: TextStyle(
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                  color: colorsByTheme(context).defaultFont,
                ),
              ),
              const SizedBox(height: spacing8),
              BlocBuilder<SettingsFeedbackBloc, SettingsFeedbackState>(
                builder: (context, state) => AppOutlinedTextField(
                  controller: _controller,
                  maxLines: 3,
                  errorText: (state is SettingsFeedbackValidateState &&
                          state.feedbackError.isNotEmpty)
                      ? state.feedbackError
                      : null,
                  onChanged: (value) {
                    context.read<SettingsFeedbackBloc>().add(
                          SettingsFeedbackValidateEvent(
                              rating: ratingValue, feedback: _controller.text),
                        );
                  },
                ),
              ),
              const SizedBox(height: spacing32),
              BlocBuilder<SettingsFeedbackBloc, SettingsFeedbackState>(
                builder: (context, state) => AppFilledButton(
                  text: S.current.txtSend,
                  onPressed: (state is SettingsFeedbackValidateState &&
                          !state.forceDisabled)
                      ? () => context
                          .read<SettingsFeedbackBloc>()
                          .add(SettingsFeedbackSendEvent(
                            rating: ratingValue,
                            feedback: _controller.text,
                          ))
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
