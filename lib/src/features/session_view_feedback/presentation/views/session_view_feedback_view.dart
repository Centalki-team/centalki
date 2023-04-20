import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/helpers/time_helper.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../report_meeting/presentation/views/report_meeting_page.dart';

class SessionViewFeedbackView extends StatefulWidget {
  const SessionViewFeedbackView({
    Key? key,
    // required this.topicId,
  }) : super(key: key);

  // final String topicId;

  @override
  State<SessionViewFeedbackView> createState() =>
      _SessionViewFeedbackViewState();
}

class _SessionViewFeedbackViewState extends State<SessionViewFeedbackView> {
  final hasFeedback = true;

  @override
  Widget build(BuildContext context) =>
      // BlocListener<SessionViewFeedbackBloc, SessionViewFeedbackState>(
      //   listener: (context, state) {
      //     if (state is SessionViewFeedbackLoadingState) {
      //       LoadingManager.setLoading(
      //         context,
      //         loading: state.showLoading,
      //       );
      //     } else if (state is SessionViewFeedbackLoadFailedState) {
      //       AppToast(
      //         mode: AppToastMode.error,
      //         duration: const Duration(seconds: 3),
      //         bottomOffset: 8.0,
      //         message: Text(
      //           state.exception.displayMessage,
      //           style: const TextStyle(
      //             fontSize: bodyLargeSize,
      //             fontWeight: bodyLargeWeight,
      //             color: AppColor.white,
      //           ),
      //         ),
      //       ).show(context);
      //     }
      //   },
      // child:
      Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 24.0,
              ),
              child: AppElevatedButton(
                onPressed: () => {},
                text: 'Feedback for Teacher',
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ),
          body:
              // BlocBuilder<SessionViewFeedbackBloc, SessionViewFeedbackState>(
              //   buildWhen: (previous, current) =>
              //       previous != current &&
              //       (current is SessionViewFeedbackLoadDoneState),
              //   builder: (context, state) {
              //     if (state is SessionViewFeedbackLoadDoneState) {
              //       return
              Stack(
            children: [
              Container(
                height: 144.0 + MediaQuery.of(context).padding.top,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/centalki.appspot.com/o/public%2Fmovie.jpeg?alt=media&token=8ce8932e-3d7e-4bba-a9c2-0a87b73c4927',
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
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Your Hobbies',
                            style: TextStyle(
                              fontSize: headlineLargeSize,
                              fontWeight: headlineLargeWeight,
                            ),
                          ),
                        ),
                        const SizedBox(height: spacing6),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Nguyễn Huy Tùng',
                            style: TextStyle(
                              height: 1.15,
                              fontSize: bodyLargeSize,
                              fontWeight: bodyLargeWeight,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            DateTimeHelper.timeToString5(DateTime.now()),
                            style: const TextStyle(
                              height: 1.15,
                              fontSize: bodyLargeSize,
                              fontWeight: bodyLargeWeight,
                              color: AppColor.secondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: spacing16),
                        const Text(
                          'Rating from Teacher',
                          style: TextStyle(
                            height: 1.15,
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: spacing8),
                        hasFeedback
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Pronunciation',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RatingBar(
                                        initialRating: 5,
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
                                        'Vocabularies',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RatingBar(
                                        initialRating: 4,
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
                                        'Grammar',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RatingBar(
                                        initialRating: 4,
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
                                        'Idea',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RatingBar(
                                        initialRating: 5,
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
                                        'Fluency',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontSize: bodyLargeSize,
                                          fontWeight: bodyLargeWeight,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RatingBar(
                                        initialRating: 3,
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
                                    'Description',
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: spacing8),
                                  const Text(
                                    'You often mispronounce the sounds and intonation of English. You also stress the wrong syllables and words in a sentence. However, you have a rich vocabulary. ...',
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: bodyLargeSize,
                                      fontWeight: bodyLargeWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: spacing24),
                                  const Text(
                                    'Suggestions',
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: spacing8),
                                  const Text(
                                    'You should work on your pronunciation and try to listen to more native speakers and repeat after them. ...',
                                    style: TextStyle(
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
                                    'No Feedback Yet',
                                    style: TextStyle(
                                      height: 1.15,
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.shadow,
                                    ),
                                  ),
                                  SizedBox(height: spacing8),
                                  Text(
                                    'You will receive a notification right after the teacher provides feedback.',
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
                            AppTextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ReportMeetingPage(),
                                  // settings: RouteSettings(arguments: args),
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
