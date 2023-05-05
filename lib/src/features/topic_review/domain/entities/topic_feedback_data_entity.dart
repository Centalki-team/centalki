import 'package:equatable/equatable.dart';

import 'topic_feedback_chip_entity.dart';

class TopicFeedbackDataEntity extends Equatable {
  TopicFeedbackDataEntity({
    required this.topicId,
    this.nameFbDetail = '',
    this.picFbDetail = '',
    this.descriptionFbDetail = '',
    this.vocabFbDetail = '',
    this.qnaFbDetail = '',
    this.nameFb = const [],
    this.picFb = const [],
    this.descriptionFb = const [],
    this.vocabFb = const [],
    this.qnaFb = const [],
  });

  late String topicId;
  late String nameFbDetail;
  late String picFbDetail;
  late String descriptionFbDetail;
  late String vocabFbDetail;
  late String qnaFbDetail;
  late List<TopicFeedbackChipEntity> nameFb;
  late List<TopicFeedbackChipEntity> picFb;
  late List<TopicFeedbackChipEntity> descriptionFb;
  late List<TopicFeedbackChipEntity> vocabFb;
  late List<TopicFeedbackChipEntity> qnaFb;

  bool get isEmptyData =>
      nameFbDetail.trim().isEmpty &&
      picFbDetail.trim().isEmpty &&
      descriptionFbDetail.trim().isEmpty &&
      vocabFbDetail.trim().isEmpty &&
      qnaFbDetail.trim().isEmpty &&
      nameFb.isEmpty &&
      picFb.isEmpty &&
      descriptionFb.isEmpty &&
      vocabFb.isEmpty &&
      qnaFb.isEmpty;

  @override
  List<Object?> get props => [
        topicId,
        nameFbDetail,
        picFbDetail,
        descriptionFbDetail,
        vocabFbDetail,
        qnaFbDetail,
        nameFb,
        picFb,
        descriptionFb,
        vocabFb,
        qnaFb,
      ];
}
