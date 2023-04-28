import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  final List<String> selectedLevels = [];

  @override
  Widget build(BuildContext context) =>
      BlocListener<TopicSuggestionBloc, TopicSuggestionState>(
        listener: (context, state) async {
          if (state is TopicSuggestionSendingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is TopicSuggestionSendDoneState) {
              await showDialog(
                context: context,
                builder: (context) => const SuccessDialogContent(
                  title: TextDoc.txtSendTopicSuggestionSuccess,
                ),
              );
              if (mounted) {
                Navigator.pop(context);
              }
            } else if (state is TopicSuggestionSendErrorState) {
              await showDialog(
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: TextDoc.txtSendTopicSuggestionFailed,
                  content: state.exception.displayMessage,
                ),
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: BlocBuilder<TopicSuggestionBloc, TopicSuggestionState>(
            buildWhen: (previous, current) =>
                current != previous && current is TopicSuggestionLoadDoneState,
            builder: (context, state) {
              if (state is TopicSuggestionLoadDoneState) {
                final levels = state.contents;

                return CustomScrollView(
                  slivers: [
                    SliverAppBar.medium(
                      leading: GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                        }),
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
                                        summaryLevel: selectedLevels,
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
                                        label: Text(e),
                                        labelStyle: const TextStyle(
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: AppColor.defaultFont,
                                        ),
                                        checkmarkColor: AppColor.defaultFont,
                                        selectedColor:
                                            AppColor.mainColor2Surface,
                                        selected: selectedLevels.contains(e),
                                        onSelected: (_) {
                                          setState(() {
                                            if (selectedLevels.contains(e)) {
                                              selectedLevels.remove(e);
                                            } else {
                                              selectedLevels.add(e);
                                            }
                                          });
                                          context
                                              .read<TopicSuggestionBloc>()
                                              .add(TopicSuggestionValidateEvent(
                                                subjectAndCategory:
                                                    subjectController.text,
                                                descriptionAndRequirements:
                                                    descriptionController.text,
                                                summaryLevel: selectedLevels,
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
                                  hintText:
                                      TextDoc.txtDescriptionAndRequirementsHint,
                                  controller: descriptionController,
                                  minLines: 4,
                                  maxLines: 6,
                                  errorText:
                                      (state is TopicSuggestionValidateState &&
                                              state.descriptionError.isNotEmpty)
                                          ? state.descriptionError
                                          : null,
                                  onChanged: (_) => context
                                      .read<TopicSuggestionBloc>()
                                      .add(TopicSuggestionValidateEvent(
                                        subjectAndCategory:
                                            subjectController.text,
                                        descriptionAndRequirements:
                                            descriptionController.text,
                                        summaryLevel: selectedLevels,
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
                                  builder: (context, state) => AppFilledButton(
                                    onPressed:
                                        (state is TopicSuggestionValidateState &&
                                                !state.forceDisabled)
                                            ? () async {
                                                context
                                                    .read<TopicSuggestionBloc>()
                                                    .add(
                                                      TopicSuggestionSendEvent(
                                                        subjectAndCategory:
                                                            subjectController
                                                                .text,
                                                        descriptionAndRequirements:
                                                            descriptionController
                                                                .text,
                                                        summaryLevel:
                                                            selectedLevels,
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
      );
}
