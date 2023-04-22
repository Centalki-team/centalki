import 'package:equatable/equatable.dart';

class TopicFeedbackResponseEntity extends Equatable {
  const TopicFeedbackResponseEntity({
    required this.id,
    required this.userId,
    required this.topicId,
    required this.topicNameSummary,
    required this.topicNameDetail,
    required this.topicPhotoSummary,
    required this.topicPhotoDetail,
    required this.topicDescriptionSummary,
    required this.topicDescriptionDetail,
    required this.topicVocabSummary,
    required this.topicVocabDetail,
    required this.topicQuestionSummary,
    required this.topicQuestionDetail,
  });

  final String userId;
  final String topicId;
  final List<String> topicNameSummary;
  final String topicNameDetail;
  final List<String> topicPhotoSummary;
  final String topicPhotoDetail;
  final List<String> topicDescriptionSummary;
  final String topicDescriptionDetail;
  final List<String> topicVocabSummary;
  final String topicVocabDetail;
  final List<String> topicQuestionSummary;
  final String topicQuestionDetail;
  final String id;

  @override
  List<Object?> get props => [
    id,
    userId,
    topicId,
    topicNameSummary,
    topicNameDetail,
    topicPhotoSummary,
    topicPhotoDetail,
    topicDescriptionSummary,
    topicDescriptionDetail,
    topicVocabSummary,
    topicVocabDetail,
    topicQuestionSummary,
    topicQuestionDetail,
  ];
}
