import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../../blocs/session_give_feedback_bloc/session_give_feedback_bloc.dart';

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

  final satisfiedProblems = <String>[
    "Teacher was nice",
    "Teacher was patient",
    "Teacher was knowledgeable",
    "Others"
  ];
  final notSatisfiedProblems = <String>[
    "Teacher spoke too fast",
    "Teacher spoke too low",
    "Teacher pronounced not clearly",
    "Teacher used too many advanced words",
    "Others"
  ];
  var selectedSatisfied = <bool>[false, false, false, false];
  var selectedNotSatisfied = <bool>[false, false, false, false, false];

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return BlocListener<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
      listener: (context, state) async {
        if (state is SessionGiveFeedbackSendingState) {
          LoadingManager.setLoading(context, loading: true);
        } else {
          LoadingManager.setLoading(context);
          if (state is SessionGiveFeedbackSendDoneState) {
            await showDialog(
              context: context,
              builder: (context) => const SuccessDialogContent(
                title: 'Send successfully',
              ),
            );
            if (mounted) {
              Navigator.pop(context);
            }
          } else if (state is SessionGiveFeedbackSendErrorState) {
            await showDialog(
              context: context,
              builder: (context) => ErrorDialogContent(
                title: 'Send failed',
                content: state.exception.displayMessage,
              ),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
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
                    TextDoc.txtSessionFeedback,
                    style: TextStyle(
                      fontSize: headlineSmallSize,
                      fontWeight: headlineSmallWeight,
                      color: AppColor.defaultFont,
                    ),
                  ),
                ],
              ),
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
                      const SizedBox(height: spacing8),
                      const Text(
                        TextDoc.txtRating,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
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
                                      .add(SessionGiveFeedbackValidateEvent(
                                        rating: ratingValue,
                                        satisfiedDescription:
                                            satisfiedDescriptionController.text,
                                        notSatisfiedDescription:
                                            notSatisfiedDescriptionController
                                                .text,
                                        selectedSatisfied: selectedSatisfied,
                                        selectedNotSatisfied:
                                            selectedNotSatisfied,
                                        suggestions: suggestionsController.text,
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
                      const Text(
                        TextDoc.txtSatisfiedDesciptionLabel,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      BlocBuilder<SessionGiveFeedbackBloc,
                          SessionGiveFeedbackState>(
                        builder: ((context, state) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: spacing16,
                                  runSpacing: spacing8,
                                  children: satisfiedProblems
                                      .map((e) => FilterChip(
                                          label: Text(e),
                                          labelStyle: const TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                          checkmarkColor: AppColor.defaultFont,
                                          selectedColor:
                                              AppColor.mainColor2Surface,
                                          selected: selectedSatisfied[
                                              satisfiedProblems.indexOf(e)],
                                          onSelected: (value) {
                                            setState(() {
                                              selectedSatisfied[
                                                  satisfiedProblems
                                                      .indexOf(e)] = value;
                                            });
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
                                                  selectedSatisfied:
                                                      selectedSatisfied,
                                                  selectedNotSatisfied:
                                                      selectedNotSatisfied,
                                                  suggestions:
                                                      suggestionsController
                                                          .text,
                                                ));
                                          }))
                                      .toList(),
                                ),
                                (state is SessionGiveFeedbackValidateState &&
                                        state.satisfiedChipError.isNotEmpty)
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
                      const Text(
                        TextDoc.txtDescriptionLabel,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      BlocBuilder<SessionGiveFeedbackBloc,
                          SessionGiveFeedbackState>(
                        builder: (context, state) => AppOutlinedTextField(
                          hintText: TextDoc.txtSatisfiedDescriptionHint,
                          controller: satisfiedDescriptionController,
                          maxLines: 5,
                          errorText: (state
                                      is SessionGiveFeedbackValidateState &&
                                  state.satisfiedDescriptionError.isNotEmpty)
                              ? state.satisfiedDescriptionError
                              : null,
                          onChanged: (_) => context
                              .read<SessionGiveFeedbackBloc>()
                              .add(SessionGiveFeedbackValidateEvent(
                                rating: ratingValue,
                                satisfiedDescription:
                                    satisfiedDescriptionController.text,
                                notSatisfiedDescription:
                                    notSatisfiedDescriptionController.text,
                                selectedSatisfied: selectedSatisfied,
                                selectedNotSatisfied: selectedNotSatisfied,
                                suggestions: suggestionsController.text,
                              )),
                        ),
                      ),
                      const SizedBox(height: spacing16),
                      const Text(
                        TextDoc.txtNotSatisfiedDesciptionLabel,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      BlocBuilder<SessionGiveFeedbackBloc,
                          SessionGiveFeedbackState>(
                        builder: ((context, state) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: spacing16,
                                  runSpacing: spacing8,
                                  children: notSatisfiedProblems
                                      .map((e) => FilterChip(
                                          label: Text(e),
                                          labelStyle: const TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                          checkmarkColor: AppColor.defaultFont,
                                          selectedColor:
                                              AppColor.mainColor2Surface,
                                          selected: selectedNotSatisfied[
                                              notSatisfiedProblems.indexOf(e)],
                                          onSelected: (value) {
                                            setState(() {
                                              selectedNotSatisfied[
                                                  notSatisfiedProblems
                                                      .indexOf(e)] = value;
                                            });
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
                                                  selectedSatisfied:
                                                      selectedSatisfied,
                                                  selectedNotSatisfied:
                                                      selectedNotSatisfied,
                                                  suggestions:
                                                      suggestionsController
                                                          .text,
                                                ));
                                          }))
                                      .toList(),
                                ),
                                (state is SessionGiveFeedbackValidateState &&
                                        state.notSatisfiedChipError.isNotEmpty)
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
                      const Text(
                        TextDoc.txtDescriptionLabel,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      BlocBuilder<SessionGiveFeedbackBloc,
                          SessionGiveFeedbackState>(
                        builder: (context, state) => AppOutlinedTextField(
                          hintText: TextDoc.txtNotSatisfiedDescriptionHint,
                          controller: notSatisfiedDescriptionController,
                          maxLines: 5,
                          errorText: (state
                                      is SessionGiveFeedbackValidateState &&
                                  state.notSatisfiedDescriptionError.isNotEmpty)
                              ? state.notSatisfiedDescriptionError
                              : null,
                          onChanged: (_) => context
                              .read<SessionGiveFeedbackBloc>()
                              .add(SessionGiveFeedbackValidateEvent(
                                rating: ratingValue,
                                satisfiedDescription:
                                    satisfiedDescriptionController.text,
                                notSatisfiedDescription:
                                    notSatisfiedDescriptionController.text,
                                selectedSatisfied: selectedSatisfied,
                                selectedNotSatisfied: selectedNotSatisfied,
                                suggestions: suggestionsController.text,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: spacing16,
                      ),
                      const Text(
                        TextDoc.txtSuggetionsLabel,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      BlocBuilder<SessionGiveFeedbackBloc,
                          SessionGiveFeedbackState>(
                        builder: (context, state) => AppOutlinedTextField(
                          hintText: TextDoc.txtSuggetionsHint,
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
                                    notSatisfiedDescriptionController.text,
                                selectedSatisfied: selectedSatisfied,
                                selectedNotSatisfied: selectedNotSatisfied,
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
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 24.0,
            ),
            child:
                BlocBuilder<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
              builder: (context, state) => AppFilledButton(
                onPressed: (state is SessionGiveFeedbackValidateState &&
                        !state.forceDisabled)
                    ? () async {
                        var summarySatisfied = <String>[];
                        var summaryNotSatisfied = <String>[];
                        for (var i = 0; i < selectedSatisfied.length; i++) {
                          if (selectedSatisfied[i]) {
                            summarySatisfied.add(satisfiedProblems[i]);
                          }
                        }
                        for (var i = 0; i < selectedNotSatisfied.length; i++) {
                          if (selectedNotSatisfied[i]) {
                            summaryNotSatisfied.add(notSatisfiedProblems[i]);
                          }
                        }
                        // context.read<SessionGiveFeedbackBloc>().add(
                        //       SessionGiveFeedbackLoadEvent(
                        //         teacherId: args.teacherId ?? '',
                        //         problems: summary,
                        //         description: descriptionController.text,
                        //       ),
                        //     );
                      }
                    : null,
                text: TextDoc.txtSend,
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
