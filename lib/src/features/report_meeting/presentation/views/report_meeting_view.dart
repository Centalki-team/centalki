import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../base/widgets/text_fields/outlined_text_field.dart';
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
  var selectedProblems = <bool>[false, false, false, false, false, false];

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
              builder: (context) => const SuccessDialogContent(
                title: 'Send successfully',
              ),
            );
            if (mounted) {
              Navigator.pop(context);
            }
          } else if (state is ReportMeetingLoadFailureState) {
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
        appBar: AppBar(),
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
                const Text(
                  'Summarize your problem',
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
                  children: problems
                      .map((e) => FilterChip(
                          label: Text(e),
                          labelStyle: const TextStyle(
                            fontSize: bodyLargeSize,
                            fontWeight: bodyLargeWeight,
                            color: AppColor.defaultFont,
                          ),
                          checkmarkColor: AppColor.defaultFont,
                          selectedColor: AppColor.mainColor2Surface,
                          selected: selectedProblems[problems.indexOf(e)],
                          onSelected: (value) {
                            setState(() {
                              selectedProblems[problems.indexOf(e)] = value;
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
                  controller: descriptionController,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: spacing12,
                ),
                AppFilledButton(
                  onPressed: () async {
                    var summary = <String>[];
                    for (var i = 0; i < selectedProblems.length; i++) {
                      if (selectedProblems[i]) {
                        summary.add(problems[i]);
                      }
                    }
                    context.read<ReportMeetingBloc>().add(
                          ReportMeetingLoadEvent(
                            teacherId: args.teacherId ?? '',
                            problems: summary,
                            description: descriptionController.text,
                          ),
                        );
                  },
                  text: 'Send',
                  minimumSize: const Size.fromHeight(48),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
