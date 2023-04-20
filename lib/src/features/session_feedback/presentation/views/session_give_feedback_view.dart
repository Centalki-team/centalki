import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';

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

    // return BlocListener<SessionGiveFeedbackBloc, SessionGiveFeedbackState>(
    //   listener: (context, state) async {
    //     if (state is SessionGiveFeedbackLoadingState) {
    //       LoadingManager.setLoading(context, loading: true);
    //     } else {
    //       LoadingManager.setLoading(context);
    //       if (state is SessionGiveFeedbackLoadDoneState) {
    //         await showDialog(
    //           context: context,
    //           builder: (context) => const SuccessDialogContent(
    //             title: 'Send successfully',
    //           ),
    //         );
    //         if (mounted) {
    //           Navigator.pop(context);
    //         }
    //       } else if (state is SessionGiveFeedbackLoadFailureState) {
    //         await showDialog(
    //           context: context,
    //           builder: (context) => ErrorDialogContent(
    //             title: 'Send failed',
    //             content: state.exception.displayMessage,
    //           ),
    //         );
    //       }
    //     }
    //   },
    // child:
    return Scaffold(
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
                  'Session Feedback',
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
                      'Rating',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(height: spacing16),
                    Center(
                      child:
                          // BlocBuilder<SettingsFeedbackBloc, SettingsFeedbackState>(
                          //   builder: (context, state) =>
                          Column(
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
                              // context.read<SettingsFeedbackBloc>().add(
                              //     SettingsFeedbackValidateEvent(
                              //         rating: ratingValue, feedback: _controller.text));
                            },
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: padding12,
                            ),
                          ),
                          // (state is SettingsFeedbackValidateState &&
                          //         state.ratingError.isNotEmpty)
                          //     ? Align(
                          //         alignment: Alignment.centerLeft,
                          //         child: Text(
                          //           state.ratingError,
                          //           style: const TextStyle(
                          //             fontSize: bodySmallSize,
                          //             fontWeight: bodySmallWeight,
                          //             color: AppColor.error,
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                      // ),
                    ),
                    const SizedBox(height: spacing16),
                    const Text(
                      'What did the teacher make you satisfied with?',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(
                      height: spacing8,
                    ),
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
                              selectedColor: AppColor.mainColor2Surface,
                              selected: selectedSatisfied[
                                  satisfiedProblems.indexOf(e)],
                              onSelected: (value) {
                                setState(() {
                                  selectedSatisfied[
                                      satisfiedProblems.indexOf(e)] = value;
                                });
                              }))
                          .toList(),
                    ),
                    const SizedBox(
                      height: spacing16,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(
                      height: spacing8,
                    ),
                    AppOutlinedTextField(
                      hintText:
                          'It would be nice if you could tell teacher more about what made your experiences good.',
                      controller: satisfiedDescriptionController,
                      maxLines: 5,
                    ),
                    const SizedBox(height: spacing16),
                    const Text(
                      'What did the teacher make you not satisfied with?',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(
                      height: spacing8,
                    ),
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
                              selectedColor: AppColor.mainColor2Surface,
                              selected: selectedNotSatisfied[
                                  notSatisfiedProblems.indexOf(e)],
                              onSelected: (value) {
                                setState(() {
                                  selectedNotSatisfied[
                                      notSatisfiedProblems.indexOf(e)] = value;
                                });
                              }))
                          .toList(),
                    ),
                    const SizedBox(
                      height: spacing16,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(
                      height: spacing8,
                    ),
                    AppOutlinedTextField(
                      hintText:
                          'It would be nice if you could tell teacher more about what made your experiences not good.',
                      controller: notSatisfiedDescriptionController,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: spacing16,
                    ),
                    const Text(
                      'Suggestions for Teacher',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    const SizedBox(
                      height: spacing8,
                    ),
                    AppOutlinedTextField(
                      hintText:
                          'Teachers are always welcomed to hear any suggestion that you believe will improve your overall experiences for future sessions.',
                      controller: suggestionsController,
                      maxLines: 5,
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
          child: AppFilledButton(
            onPressed: () async {
              var summarySatisfied = <String>[];
              for (var i = 0; i < selectedSatisfied.length; i++) {
                if (selectedSatisfied[i]) {
                  summarySatisfied.add(satisfiedProblems[i]);
                }
              }
              var summaryNotSatisfied = <String>[];
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
            },
            text: 'Send',
            minimumSize: const Size.fromHeight(48),
          ),
        ),
      ),
      // ),
    );
  }
}
