import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/helpers/time_helper.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../../../report_meeting/presentation/views/report_meeting_page.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../../session_feedback/presentation/views/session_give_feedback/session_give_feedback_page.dart';

class HistoryDetailView extends StatefulWidget {
  const HistoryDetailView({
    Key? key,
    required this.session,
  }) : super(key: key);

  final SessionScheduleEntity session;

  @override
  State<HistoryDetailView> createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends State<HistoryDetailView> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          widget.session.sessionFeedback?.feedbackTeacher == null
              ? SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 24.0,
                    ),
                    child: AppElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SessionGiveFeedbackPage(),
                            settings: RouteSettings(
                                arguments: ScreenArguments(
                                    widget.session.sessionTeacher?.id,
                                    widget.session.sessionId)),
                          ),
                        ),
                      },
                      text: TextDoc.txtFeedbackForTeacherBtn,
                      minimumSize: const Size.fromHeight(48),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
      body: Stack(
        children: [
          Container(
            height: 144.0 + MediaQuery.of(context).padding.top,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.session.sessionTopic?.imageURL ?? '',
                ),
                fit: BoxFit.cover,
                onError: (_, __) => SizedBox(
                  width: double.infinity,
                  height: 144 + MediaQuery.of(context).padding.top,
                  child: const Icon(
                    Icons.error_outline_rounded,
                    size: 40,
                    color: AppColor.error,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.defaultFont,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 128.0 + MediaQuery.of(context).padding.top,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.session.sessionTopic?.name ?? 'Topic name',
                        style: const TextStyle(
                          fontSize: headlineLargeSize,
                          fontWeight: headlineLargeWeight,
                        ),
                      ),
                    ),
                    const SizedBox(height: spacing6),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.session.sessionTeacher?.fullName ??
                            'Teacher name',
                        style: const TextStyle(
                          height: 1.15,
                          fontSize: bodyLargeSize,
                          fontWeight: bodyLargeWeight,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateTimeHelper.timeToString5(
                            widget.session.sessionStartAt?.toLocal() ??
                                DateTime.now()),
                        style: const TextStyle(
                          height: 1.15,
                          fontSize: bodyLargeSize,
                          fontWeight: bodyLargeWeight,
                          color: AppColor.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: spacing16),
                    Text(
                      widget.session.sessionFeedback?.feedbackStudent != null
                          ? TextDoc.txtRatingFromTeacher
                          : TextDoc.txtFeedbackFromTeacher,
                      style: const TextStyle(
                        height: 1.15,
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: spacing8),
                    widget.session.sessionFeedback?.feedbackStudent != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    TextDoc.txtPronunciation,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: widget
                                            .session
                                            .sessionFeedback
                                            ?.feedbackStudent
                                            ?.feedbackPronunciation ??
                                        0,
                                    itemSize: 24,
                                    ignoreGestures: true,
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
                                    onRatingUpdate: ((value) {}),
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    TextDoc.txtVocabularies,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: widget
                                            .session
                                            .sessionFeedback
                                            ?.feedbackStudent
                                            ?.feedbackVocabularies ??
                                        0,
                                    itemSize: 24,
                                    ignoreGestures: true,
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
                                    onRatingUpdate: ((value) {}),
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    TextDoc.txtGrammar,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: widget
                                            .session
                                            .sessionFeedback
                                            ?.feedbackStudent
                                            ?.feedbackGrammar ??
                                        0,
                                    itemSize: 24,
                                    ignoreGestures: true,
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
                                    onRatingUpdate: ((value) {}),
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    TextDoc.txtIdea,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: widget
                                            .session
                                            .sessionFeedback
                                            ?.feedbackStudent
                                            ?.feedbackIdea ??
                                        0,
                                    itemSize: 24,
                                    ignoreGestures: true,
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
                                    onRatingUpdate: ((value) {}),
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    TextDoc.txtFluency,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: widget
                                            .session
                                            .sessionFeedback
                                            ?.feedbackStudent
                                            ?.feedbackFluency ??
                                        0,
                                    itemSize: 24,
                                    ignoreGestures: true,
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
                                    onRatingUpdate: ((value) {}),
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacing24),
                              const Text(
                                TextDoc.txtDescriptionLabel,
                                style: TextStyle(
                                  height: 1.15,
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: spacing8),
                              Text(
                                widget.session.sessionFeedback?.feedbackStudent
                                        ?.feedbackDescription ??
                                    'No description',
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: bodyLargeSize,
                                  fontWeight: bodyLargeWeight,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: spacing24),
                              const Text(
                                TextDoc.txtSuggestions,
                                style: TextStyle(
                                  height: 1.15,
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: spacing8),
                              Text(
                                (widget.session.sessionFeedback?.feedbackStudent
                                                ?.suggestions !=
                                            null &&
                                        widget
                                            .session
                                            .sessionFeedback!
                                            .feedbackStudent!
                                            .suggestions!
                                            .isNotEmpty)
                                    ? widget.session.sessionFeedback!
                                        .feedbackStudent!.suggestions!
                                    : 'No suggestions',
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: bodyLargeSize,
                                  fontWeight: bodyLargeWeight,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: const [
                              Text(
                                TextDoc.txtFeedbackEmptyHeadline,
                                style: TextStyle(
                                  height: 1.15,
                                  fontSize: titleMediumSize,
                                  fontWeight: titleMediumWeight,
                                  color: AppColor.shadow,
                                ),
                              ),
                              SizedBox(height: spacing8),
                              Text(
                                TextDoc.txtFeedbackEmptyContent,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.15,
                                  fontSize: bodyLargeSize,
                                  fontWeight: bodyLargeWeight,
                                  color: AppColor.shadow,
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: spacing24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          TextDoc.txtSessionCompletedAskForReport,
                          style: TextStyle(
                            fontSize: bodyMediumSize,
                            fontWeight: bodyMediumWeight,
                            color: AppColor.shadow,
                          ),
                        ),
                        const SizedBox(
                          width: spacing8,
                        ),
                        AppTextButton(
                          minimumSize: const Size(124, 20),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ReportMeetingPage(),
                              settings: RouteSettings(
                                  arguments: ScreenArguments(
                                      widget.session.sessionTeacher?.id,
                                      widget.session.sessionId)),
                            ),
                          ),
                          text: TextDoc.txtSessionCompletedReportBtn,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
}
