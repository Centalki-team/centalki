import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../blocs/topic_suggestion_bloc.dart';

class TopicSuggestionView extends StatefulWidget {
  const TopicSuggestionView({Key? key}) : super(key: key);

  @override
  State<TopicSuggestionView> createState() => _TopicSuggestionViewState();
}

class _TopicSuggestionViewState extends State<TopicSuggestionView> {
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedLevel = '';
  bool allowPop = false;

  _showExitOptionDialog() async {
    final res = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text(
                TextDoc.txtNotFinishTopicSuggest,
                style: TextStyle(
                  fontSize: titleLargeSize,
                  fontWeight: titleLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              content: const Text(
                TextDoc.txtNotFinishTopicSuggestContent,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mainColor1,
                  ),
                  child: const Text(
                    TextDoc.txtStayBtn,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.error,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    TextDoc.txtExitBtn,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
              ],
            ));
    allowPop = res;
    if (allowPop) {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  _showSuccessDialog() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text(
                TextDoc.txtSendTopicSuggestSuccess,
                style: TextStyle(
                  fontSize: titleLargeSize,
                  fontWeight: titleLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              content: const Text(
                TextDoc.txtSendTopicSuggestSuccessContent,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mainColor1,
                  ),
                  child: const Text(
                    TextDoc.txtOk,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
              ],
            ));
    allowPop = true;
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(allowPop),
        child: BlocListener<TopicSuggestionBloc, TopicSuggestionState>(
          listener: (context, state) async {
            if (state is TopicSuggestionSendingState) {
              LoadingManager.setLoading(context, loading: true);
            } else {
              LoadingManager.setLoading(context);
              if (state is TopicSuggestionSendDoneState) {
                _showSuccessDialog();
              } else if (state is TopicSuggestionSendErrorState) {
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
              }
            }
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: AppColor.white,
              body: BlocBuilder<TopicSuggestionBloc, TopicSuggestionState>(
                buildWhen: (previous, current) =>
                    current != previous &&
                    current is TopicSuggestionLoadDoneState,
                builder: (context, state) {
                  if (state is TopicSuggestionLoadDoneState) {
                    final levels = state.contents;

                    return CustomScrollView(
                      slivers: [
                        SliverAppBar.medium(
                          leading: GestureDetector(
                            onTap: _showExitOptionDialog,
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColor.defaultFont,
                            ),
                          ),
                          title: const Text(
                            TextDoc.txtTopicSuggestion,
                            style: TextStyle(
                              fontSize: headlineSmallSize,
                              fontWeight: headlineSmallWeight,
                              color: AppColor.defaultFont,
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
                                  const Text(
                                    TextDoc.txtSubjectLabel,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  const Text(
                                    TextDoc.txtSubjectSubTitle,
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: bodySmallSize,
                                      fontWeight: bodySmallWeight,
                                      color: AppColor.shadow,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacing24,
                                  ),
                                  BlocBuilder<TopicSuggestionBloc,
                                      TopicSuggestionState>(
                                    builder: (context, state) =>
                                        AppOutlinedTextField(
                                      hintText: TextDoc.txtSubjectHint,
                                      controller: subjectController,
                                      maxLines: 4,
                                      errorText:
                                          (state is TopicSuggestionValidateState &&
                                                  state.subjectError.isNotEmpty)
                                              ? state.subjectError
                                              : null,
                                      onChanged: (_) => context
                                          .read<TopicSuggestionBloc>()
                                          .add(TopicSuggestionValidateEvent(
                                            subjectAndCategory:
                                                subjectController.text,
                                            descriptionAndRequirements:
                                                descriptionController.text,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacing24,
                                  ),
                                  const Text(
                                    TextDoc.txtLevelLabel,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  const Text(
                                    TextDoc.txtLevelSubTitle,
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: bodySmallSize,
                                      fontWeight: bodySmallWeight,
                                      color: AppColor.shadow,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacing16,
                                  ),
                                  Wrap(
                                    spacing: spacing16,
                                    runSpacing: spacing8,
                                    children: levels
                                        .map((e) => FilterChip(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(24.0),
                                              ),
                                            ),
                                            label: Text(e.title),
                                            labelStyle: const TextStyle(
                                              fontSize: bodyLargeSize,
                                              fontWeight: bodyLargeWeight,
                                              color: AppColor.defaultFont,
                                            ),
                                            checkmarkColor: AppColor.defaultFont,
                                            selectedColor:
                                                AppColor.mainColor2Surface,
                                            selected: (selectedLevel == e.key),
                                            onSelected: (_) {
                                              setState(() {
                                                if (selectedLevel != e.key) {
                                                  selectedLevel = e.key;
                                                } else {
                                                  selectedLevel = '';
                                                }
                                              });
                                              context
                                                  .read<TopicSuggestionBloc>()
                                                  .add(
                                                      TopicSuggestionValidateEvent(
                                                    subjectAndCategory:
                                                        subjectController.text,
                                                    descriptionAndRequirements:
                                                        descriptionController
                                                            .text,
                                                  ));
                                            }))
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: spacing24,
                                  ),
                                  const Text(
                                    TextDoc.txtDescriptionAndRequirementsLabel,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  const Text(
                                    TextDoc.txtDescriptionAndRequirementsSubTitle,
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: bodySmallSize,
                                      fontWeight: bodySmallWeight,
                                      color: AppColor.shadow,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacing16,
                                  ),
                                  BlocBuilder<TopicSuggestionBloc,
                                      TopicSuggestionState>(
                                    builder: (context, state) =>
                                        AppOutlinedTextField(
                                      hintText: TextDoc
                                          .txtDescriptionAndRequirementsHint,
                                      controller: descriptionController,
                                      minLines: 4,
                                      maxLines: 6,
                                      errorText:
                                          (state is TopicSuggestionValidateState &&
                                                  state.descriptionError
                                                      .isNotEmpty)
                                              ? state.descriptionError
                                              : null,
                                      onChanged: (_) => context
                                          .read<TopicSuggestionBloc>()
                                          .add(TopicSuggestionValidateEvent(
                                            subjectAndCategory:
                                                subjectController.text,
                                            descriptionAndRequirements:
                                                descriptionController.text,
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spacing24 * 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 24.0,
                                    ),
                                    child: BlocBuilder<TopicSuggestionBloc,
                                        TopicSuggestionState>(
                                      builder: (context, state) =>
                                          AppFilledButton(
                                        onPressed:
                                            (state is TopicSuggestionValidateState &&
                                                    !state.forceDisabled)
                                                ? () async {
                                                    context
                                                        .read<
                                                            TopicSuggestionBloc>()
                                                        .add(
                                                          TopicSuggestionSendEvent(
                                                            subjectAndCategory:
                                                                subjectController
                                                                    .text,
                                                            descriptionAndRequirements:
                                                                descriptionController
                                                                    .text,
                                                            selectedLevel:
                                                                selectedLevel,
                                                          ),
                                                        );
                                                  }
                                                : null,
                                        text: TextDoc.txtSend,
                                        minimumSize: const Size.fromHeight(48),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is TopicSuggestionLoadFailedState) {
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
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
