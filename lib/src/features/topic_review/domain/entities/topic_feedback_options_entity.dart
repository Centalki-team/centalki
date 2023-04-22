import 'package:equatable/equatable.dart';

import 'topic_feedback_chip_entity.dart';

class TopicFeedbackOptionsEntity extends Equatable {
  const TopicFeedbackOptionsEntity({
    this.topicName = const [],
    this.topicPhoto = const [],
    this.topicDescription = const [],
    this.topicQuestions = const [],
    this.topicVocab = const [],
  });

  final List<TopicFeedbackChipEntity> topicName;
  final List<TopicFeedbackChipEntity> topicPhoto;
  final List<TopicFeedbackChipEntity> topicDescription;
  final List<TopicFeedbackChipEntity> topicQuestions;
  final List<TopicFeedbackChipEntity> topicVocab;

  @override
  List<Object?> get props => [
        topicName,
        topicPhoto,
        topicDescription,
        topicQuestions,
        topicVocab,
      ];
}
