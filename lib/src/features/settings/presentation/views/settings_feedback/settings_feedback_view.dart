import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
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
                S.current.txtGiveFeedback,
                style: const TextStyle(
                  fontSize: headlineSmallSize,
                  fontWeight: headlineSmallWeight,
                  color: AppColor.defaultFont,
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
                    title: Text(
                      S.current.txtSuccess,
                      style: const TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    content: Text(
                      S.current.txtSuccessFeedback,
                      style: const TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: AppColor.defaultFont,
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
              } else if (state is SettingsFeedbackLoadErrorState) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      S.current.txtLoadFail,
                      style: const TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    content: Text(
                      state.exception.message,
                      style: const TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: AppColor.defaultFont,
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
                  style: const TextStyle(
                    fontSize: titleMediumSize,
                    fontWeight: titleMediumWeight,
                    color: AppColor.defaultFont,
                  ),
                ),
                const SizedBox(height: spacing16),
                Center(
                  child:
                      BlocBuilder<SettingsFeedbackBloc, SettingsFeedbackState>(
                    builder: (context, state) => Column(
                      children: [
                        RatingBar(
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
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: padding12,
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
                  style: const TextStyle(
                    fontSize: titleMediumSize,
                    fontWeight: titleMediumWeight,
                    color: AppColor.defaultFont,
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
                                rating: ratingValue,
                                feedback: _controller.text),
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
