import '../../../../domain/entities/topic_review_page_entity.dart';

class TopicReviewPageContentLocalDataSource {
  const TopicReviewPageContentLocalDataSource();

  Future<List<TopicFeedbackPageEntity>> getTopicFeedbackPagesContents() async =>
      const [
        TopicFeedbackPageEntity(
          pageTitle: 'Topic\'s Name',
          contentChips: [
            'Offensive',
            'Confusing',
            'Misleading',
            'Lacks creativity',
            'Doesn\'t reflect contents',
            'Too generic',
            'Others',
          ],
          textAreaHint:
              'We appreciate any detailed feedback from you, if possible.',
        ),
        TopicFeedbackPageEntity(
          pageTitle: 'Illustration Photo',
          contentChips: [
            'Low resolution',
            'Irrelevant',
            'Too small',
            'Too big',
            'Doesn\'t display',
            'Too distracting',
            'Offensive',
            'Others',
          ],
          textAreaHint:
              'We appreciate any detailed feedback from you, if possible.',
        ),
        TopicFeedbackPageEntity(
          pageTitle: 'Topic\'s Description',
          contentChips: [
            'Too brief',
            'Too long',
            'Poorly organized',
            'Grammar errors',
            'Spelling errors',
            'Inaccurate',
            'Others',
          ],
          textAreaHint:
              'We appreciate any detailed feedback from you, if possible.',
        ),
        TopicFeedbackPageEntity(
          pageTitle: 'Vocabularies',
          contentChips: [
            'Too basic',
            'Too advanced',
            'Misused',
            'Irrelevant to topic',
            'Inconsistent usage',
            'Unclear meaning',
            'Offensive',
            'Insufficient in quantity',
            'Others',
          ],
          textAreaHint:
              'We appreciate if you could tell us which phrases and/or examples cause the problems.',
        ),
        TopicFeedbackPageEntity(
          pageTitle: 'Questions and Answers',
          contentChips: [
            'Too basic',
            'Too advanced',
            'Repetitive',
            'Irrelevant to topic',
            'Confusing',
            'Redundant',
            'Lack variety',
            'Insufficient in quantity',
            'Others',
          ],
          textAreaHint:
              'We appreciate if you could tell us which questions and/or answers cause the problems.',
        ),
      ];
}
