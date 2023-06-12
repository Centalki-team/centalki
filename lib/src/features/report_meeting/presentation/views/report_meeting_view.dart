import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../blocs/report_meeting_bloc.dart';

class ScreenArguments {
  final String? teacherId;
  final String sessionId;
  ScreenArguments(this.teacherId, this.sessionId);
}

class ReportMeetingView extends StatefulWidget {
  const ReportMeetingView({Key? key}) : super(key: key);

  @override
  State<ReportMeetingView> createState() => _ReportMeetingViewState();
}

class _ReportMeetingViewState extends State<ReportMeetingView> {
  final descriptionController = TextEditingController();
  final problems = <String>[
    "Teacher was late",
    "Teacher did not join",
    "Network was unstable",
    "No videos",
    "No voices",
    "Others"
  ];
  ValueNotifier<List<bool>> selectedProblems =
      ValueNotifier(<bool>[false, false, false, false, false, false]);
  ValueNotifier<String> feedbackDesc = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return BlocListener<ReportMeetingBloc, ReportMeetingState>(
      listener: (context, state) async {
        if (state is ReportMeetingLoadingState) {
          LoadingManager.setLoading(context, loading: true);
        } else {
          LoadingManager.setLoading(context);
          if (state is ReportMeetingLoadDoneState) {
            await showDialog(
              context: context,
              builder: (context) => SuccessDialogContent(
                title: S.current.txtSendReportSuccess,
              ),
            );
            if (mounted) {
              Navigator.pop(context);
            }
          } else if (state is ReportMeetingLoadFailureState) {
            await showDialog(
              context: context,
              builder: (context) => ErrorDialogContent(
                title: S.current.txtSendReportFailed,
                content: state.exception.displayMessage,
              ),
            );
          }
        }
      },
      child: Scaffold(
        //backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: colorsByTheme(context).defaultFont,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing8,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.txtSummarizeYourProblem,
                  style: TextStyle(
                    fontSize: titleMediumSize,
                    fontWeight: titleMediumWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(
                  height: spacing8,
                ),
                ValueListenableBuilder(
                    valueListenable: selectedProblems,
                    builder: (_, value, __) => Wrap(
                          spacing: spacing16,
                          runSpacing: spacing8,
                          children: problems
                              .map(
                                (e) => FilterChip(
                                  backgroundColor:
                                      colorsByTheme(context).selectableChipBg,
                                  shape: const StadiumBorder(),
                                  label: Text(e),
                                  labelStyle: TextStyle(
                                    fontSize: bodyLargeSize,
                                    fontWeight: bodyLargeWeight,
                                    color: value[problems.indexOf(e)]
                                        ? AppColor.defaultFontLight
                                        : colorsByTheme(context).defaultFont,
                                  ),
                                  checkmarkColor: AppColor.defaultFontLight,
                                  selectedColor: AppColor.mainColor2Surface,
                                  selected: value[problems.indexOf(e)],
                                  onSelected: (selection) {
                                    // setState(() {
                                    //   selectedProblems[problems.indexOf(e)] = value;
                                    // });
                                    var newList =
                                        List<bool>.from(selectedProblems.value);
                                    newList[problems.indexOf(e)] = selection;
                                    selectedProblems.value = newList;
                                  },
                                ),
                              )
                              .toList(),
                        )),
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
                AppOutlinedTextField(
                  controller: descriptionController,
                  hintText: S.current.txtReportMeetingHint,
                  maxLines: 5,
                  maxLength: 500,
                  onChanged: (value) => feedbackDesc.value = value,
                ),
                const SizedBox(
                  height: spacing12,
                ),
                ValueListenableBuilder(
                    valueListenable: selectedProblems,
                    builder: (_, value, __) => ValueListenableBuilder(
                        valueListenable: feedbackDesc,
                        builder: (ctx, valueFb, w) => AppFilledButton(
                              onPressed: value.any((element) => element == true)
                                  ? (value.last && valueFb.trim().isEmpty)
                                      ? null
                                      : () {
                                          var summary = <String>[];
                                          for (var i = 0;
                                              i < value.length;
                                              i++) {
                                            if (value[i]) {
                                              summary.add(problems[i]);
                                            }
                                          }
                                          context.read<ReportMeetingBloc>().add(
                                                ReportMeetingLoadEvent(
                                                  teacherId:
                                                      args.teacherId ?? '',
                                                  problems: summary,
                                                  description: valueFb.trim(),
                                                ),
                                              );
                                        }
                                  : null,
                              text: S.current.txtSend,
                              minimumSize: const Size.fromHeight(48),
                            ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
