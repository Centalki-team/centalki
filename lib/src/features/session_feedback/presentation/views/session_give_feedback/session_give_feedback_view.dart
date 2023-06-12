import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../blocs/session_give_feedback_bloc/session_give_feedback_bloc.dart';

class SessionGiveFeedbackView extends StatefulWidget {
  const SessionGiveFeedbackView({Key? key}) : super(key: key);

  @override
  State<SessionGiveFeedbackView> createState() =>
      _SessionGiveFeedbackViewState();
}

class _SessionGiveFeedbackViewState extends State<SessionGiveFeedbackView> {
  double ratingValue = 0;
  final satisfiedDescriptionController = TextEditingController();
  final notSatisfiedDescriptionController = TextEditingController();
  final suggestionsController = TextEditingController();
  final List<String> selectedSatisfied = [];
  final List<String> selectedNotSatisfied = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return BlocListener<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
      listener: (context, state) async {
        if (state is SessionGiveFeedbackSendingState) {
          LoadingManager.setLoading(context, loading: true);
        } else {
          LoadingManager.setLoading(context);
          if (state is SessionGiveFeedbackSendDoneState) {
            await showDialog(
              context: context,
              builder: (context) => SuccessDialogContent(
                title: S.current.txtSendFeedbackSuccess,
              ),
            );
            if (mounted) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          } else if (state is SessionGiveFeedbackSendErrorState) {
            await showDialog(
              context: context,
              builder: (context) => ErrorDialogContent(
                title: S.current.txtSendFeedbackFailed,
                content: state.exception.displayMessage,
              ),
            );
          }
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //backgroundColor: AppColor.white,
          body: BlocBuilder<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
            buildWhen: (previous, current) =>
                current != previous &&
                current is SessionGiveFeedbackLoadDoneState,
            builder: (context, state) {
              if (state is SessionGiveFeedbackLoadDoneState) {
                final satisfiedProblems = state.contents.positiveContents;
                final notSatisfiedProblems = state.contents.negativeContents;

                return CustomScrollView(
                  slivers: [
                    SliverAppBar.medium(
                      expandedHeight: sliverAppBarHeight,
                      leading: GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: Icon(
                          Icons.arrow_back,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                      title: Text(
                        S.current.txtSessionFeedback,
                        style: TextStyle(
                          fontSize: headlineSmallSize,
                          fontWeight: headlineSmallWeight,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                      centerTitle: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: spacing16,
                            vertical: spacing8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.current.txtRating,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              Center(
                                child: BlocBuilder<SessionGiveFeedbackBloc,
                                    SessionGiveFeedbackState>(
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
                                          context
                                              .read<SessionGiveFeedbackBloc>()
                                              .add(
                                                  SessionGiveFeedbackValidateEvent(
                                                rating: ratingValue,
                                                satisfiedDescription:
                                                    satisfiedDescriptionController
                                                        .text,
                                                notSatisfiedDescription:
                                                    notSatisfiedDescriptionController
                                                        .text,
                                                summarySatisfied:
                                                    selectedSatisfied,
                                                summaryNotSatisfied:
                                                    selectedNotSatisfied,
                                                suggestions:
                                                    suggestionsController.text,
                                              ));
                                        },
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: padding12,
                                        ),
                                      ),
                                      (state is SessionGiveFeedbackValidateState &&
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
                                S.current.txtSatisfiedDesciptionLabel,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(
                                height: spacing8,
                              ),
                              BlocBuilder<SessionGiveFeedbackBloc,
                                  SessionGiveFeedbackState>(
                                builder: ((context, state) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: spacing16,
                                          runSpacing: spacing8,
                                          children: satisfiedProblems!
                                              .map((e) => FilterChip(
                                                  backgroundColor:
                                                      colorsByTheme(context)
                                                          .selectableChipBg,
                                                  // shape: const RoundedRectangleBorder(
                                                  //   borderRadius: BorderRadius.all(
                                                  //     Radius.circular(24.0),
                                                  //   ),
                                                  // ),
                                                  shape: const StadiumBorder(),
                                                  label: Text(e.contentTitle!),
                                                  labelStyle: TextStyle(
                                                    fontSize: bodyLargeSize,
                                                    fontWeight: bodyLargeWeight,
                                                    color: selectedSatisfied
                                                            .contains(
                                                                e.contentKey)
                                                        ? AppColor
                                                            .defaultFontLight
                                                        : colorsByTheme(context)
                                                            .defaultFont,
                                                  ),
                                                  checkmarkColor:
                                                      AppColor.defaultFontLight,
                                                  selectedColor: AppColor
                                                      .mainColor2Surface,
                                                  selected: selectedSatisfied
                                                      .contains(e.contentKey),
                                                  onSelected: (_) {
                                                    setState(() {
                                                      if (selectedSatisfied
                                                          .contains(
                                                              e.contentKey)) {
                                                        selectedSatisfied
                                                            .remove(
                                                                e.contentKey);
                                                      } else {
                                                        selectedSatisfied
                                                            .add(e.contentKey!);
                                                      }
                                                    });
                                                    context
                                                        .read<
                                                            SessionGiveFeedbackBloc>()
                                                        .add(
                                                            SessionGiveFeedbackValidateEvent(
                                                          rating: ratingValue,
                                                          satisfiedDescription:
                                                              satisfiedDescriptionController
                                                                  .text,
                                                          notSatisfiedDescription:
                                                              notSatisfiedDescriptionController
                                                                  .text,
                                                          summarySatisfied:
                                                              selectedSatisfied,
                                                          summaryNotSatisfied:
                                                              selectedNotSatisfied,
                                                          suggestions:
                                                              suggestionsController
                                                                  .text,
                                                        ));
                                                  }))
                                              .toList(),
                                        ),
                                        (state is SessionGiveFeedbackValidateState &&
                                                state.satisfiedChipError
                                                    .isNotEmpty)
                                            ? Text(
                                                state.satisfiedChipError,
                                                style: const TextStyle(
                                                  fontSize: bodySmallSize,
                                                  fontWeight: bodySmallWeight,
                                                  color: AppColor.error,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: spacing16,
                              ),
                              Text(
                                S.current.txtDescriptionLabel,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(
                                height: spacing8,
                              ),
                              BlocBuilder<SessionGiveFeedbackBloc,
                                  SessionGiveFeedbackState>(
                                builder: (context, state) =>
                                    AppOutlinedTextField(
                                  hintText:
                                      S.current.txtSatisfiedDescriptionHint,
                                  controller: satisfiedDescriptionController,
                                  maxLines: 5,
                                  errorText:
                                      (state is SessionGiveFeedbackValidateState &&
                                              state.satisfiedDescriptionError
                                                  .isNotEmpty)
                                          ? state.satisfiedDescriptionError
                                          : null,
                                  onChanged: (_) => context
                                      .read<SessionGiveFeedbackBloc>()
                                      .add(SessionGiveFeedbackValidateEvent(
                                        rating: ratingValue,
                                        satisfiedDescription:
                                            satisfiedDescriptionController.text,
                                        notSatisfiedDescription:
                                            notSatisfiedDescriptionController
                                                .text,
                                        summarySatisfied: selectedSatisfied,
                                        summaryNotSatisfied:
                                            selectedNotSatisfied,
                                        suggestions: suggestionsController.text,
                                      )),
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              Text(
                                S.current.txtNotSatisfiedDesciptionLabel,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(
                                height: spacing8,
                              ),
                              BlocBuilder<SessionGiveFeedbackBloc,
                                  SessionGiveFeedbackState>(
                                builder: ((context, state) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: spacing16,
                                          runSpacing: spacing8,
                                          children: notSatisfiedProblems!
                                              .map((e) => FilterChip(
                                                  backgroundColor:
                                                      colorsByTheme(context)
                                                          .selectableChipBg,
                                                  // shape: const RoundedRectangleBorder(
                                                  //   borderRadius: BorderRadius.all(
                                                  //     Radius.circular(24.0),
                                                  //   ),
                                                  // ),
                                                  shape: const StadiumBorder(),
                                                  label: Text(e.contentTitle!),
                                                  labelStyle: TextStyle(
                                                    fontSize: bodyLargeSize,
                                                    fontWeight: bodyLargeWeight,
                                                    color: selectedNotSatisfied
                                                            .contains(
                                                                e.contentKey)
                                                        ? AppColor
                                                            .defaultFontLight
                                                        : colorsByTheme(context)
                                                            .defaultFont,
                                                  ),
                                                  checkmarkColor:
                                                      AppColor.defaultFontLight,
                                                  selectedColor: AppColor
                                                      .mainColor2Surface,
                                                  selected: selectedNotSatisfied
                                                      .contains(e.contentKey),
                                                  onSelected: (_) {
                                                    setState(() {
                                                      if (selectedNotSatisfied
                                                          .contains(
                                                              e.contentKey)) {
                                                        selectedNotSatisfied
                                                            .remove(
                                                                e.contentKey);
                                                      } else {
                                                        selectedNotSatisfied
                                                            .add(e.contentKey!);
                                                      }
                                                    });
                                                    context
                                                        .read<
                                                            SessionGiveFeedbackBloc>()
                                                        .add(
                                                            SessionGiveFeedbackValidateEvent(
                                                          rating: ratingValue,
                                                          satisfiedDescription:
                                                              satisfiedDescriptionController
                                                                  .text,
                                                          notSatisfiedDescription:
                                                              notSatisfiedDescriptionController
                                                                  .text,
                                                          summarySatisfied:
                                                              selectedSatisfied,
                                                          summaryNotSatisfied:
                                                              selectedNotSatisfied,
                                                          suggestions:
                                                              suggestionsController
                                                                  .text,
                                                        ));
                                                  }))
                                              .toList(),
                                        ),
                                        (state is SessionGiveFeedbackValidateState &&
                                                state.notSatisfiedChipError
                                                    .isNotEmpty)
                                            ? Text(
                                                state.notSatisfiedChipError,
                                                style: const TextStyle(
                                                  fontSize: bodySmallSize,
                                                  fontWeight: bodySmallWeight,
                                                  color: AppColor.error,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: spacing16,
                              ),
                              Text(
                                S.current.txtDescriptionLabel,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(
                                height: spacing8,
                              ),
                              BlocBuilder<SessionGiveFeedbackBloc,
                                  SessionGiveFeedbackState>(
                                builder: (context, state) =>
                                    AppOutlinedTextField(
                                  hintText:
                                      S.current.txtNotSatisfiedDescriptionHint,
                                  controller: notSatisfiedDescriptionController,
                                  maxLines: 5,
                                  errorText:
                                      (state is SessionGiveFeedbackValidateState &&
                                              state.notSatisfiedDescriptionError
                                                  .isNotEmpty)
                                          ? state.notSatisfiedDescriptionError
                                          : null,
                                  onChanged: (_) => context
                                      .read<SessionGiveFeedbackBloc>()
                                      .add(SessionGiveFeedbackValidateEvent(
                                        rating: ratingValue,
                                        satisfiedDescription:
                                            satisfiedDescriptionController.text,
                                        notSatisfiedDescription:
                                            notSatisfiedDescriptionController
                                                .text,
                                        summarySatisfied: selectedSatisfied,
                                        summaryNotSatisfied:
                                            selectedNotSatisfied,
                                        suggestions: suggestionsController.text,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: spacing16,
                              ),
                              Text(
                                S.current.txtSuggetionsLabel,
                                style: TextStyle(
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: colorsByTheme(context).defaultFont,
                                ),
                              ),
                              const SizedBox(
                                height: spacing8,
                              ),
                              BlocBuilder<SessionGiveFeedbackBloc,
                                  SessionGiveFeedbackState>(
                                builder: (context, state) =>
                                    AppOutlinedTextField(
                                  hintText: S.current.txtSuggetionsHint,
                                  controller: suggestionsController,
                                  maxLines: 5,
                                  errorText:
                                      (state is SessionGiveFeedbackValidateState &&
                                              state.suggestionsError.isNotEmpty)
                                          ? state.suggestionsError
                                          : null,
                                  onChanged: (_) => context
                                      .read<SessionGiveFeedbackBloc>()
                                      .add(SessionGiveFeedbackValidateEvent(
                                        rating: ratingValue,
                                        satisfiedDescription:
                                            satisfiedDescriptionController.text,
                                        notSatisfiedDescription:
                                            notSatisfiedDescriptionController
                                                .text,
                                        summarySatisfied: selectedSatisfied,
                                        summaryNotSatisfied:
                                            selectedNotSatisfied,
                                        suggestions: suggestionsController.text,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: spacing12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is SessionGiveFeedbackLoadFailedState) {
                AppToast(
                  mode: AppToastMode.error,
                  duration: const Duration(seconds: 3),
                  bottomOffset: 8.0,
                  message: Text(
                    state.exception.displayMessage,
                    style: const TextStyle(
                      fontSize: bodyLargeSize,
                      fontWeight: bodyLargeWeight,
                      color: AppColor.white,
                    ),
                  ),
                ).show(context);
                return const SizedBox.shrink();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          bottomNavigationBar:
              BlocBuilder<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
            buildWhen: (previous, current) =>
                current != previous &&
                current is SessionGiveFeedbackLoadDoneState,
            builder: (context, state) {
              if (state is SessionGiveFeedbackLoadDoneState) {
                return SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 24.0,
                    ),
                    child: BlocBuilder<SessionGiveFeedbackBloc,
                        SessionGiveFeedbackState>(
                      builder: (context, state) => AppFilledButton(
                        onPressed: (state is SessionGiveFeedbackValidateState &&
                                !state.forceDisabled)
                            ? () async {
                                context.read<SessionGiveFeedbackBloc>().add(
                                      SessionGiveFeedbackSendEvent(
                                        sessionId: args.sessionId,
                                        rating: ratingValue,
                                        summarySatisfied: selectedSatisfied,
                                        summaryNotSatisfied:
                                            selectedNotSatisfied,
                                        satisfiedDescription:
                                            satisfiedDescriptionController.text,
                                        notSatisfiedDescription:
                                            notSatisfiedDescriptionController
                                                .text,
                                        suggestions: suggestionsController.text,
                                      ),
                                    );
                              }
                            : null,
                        text: S.current.txtSend,
                        minimumSize: const Size.fromHeight(48),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
