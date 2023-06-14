import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'topic_feedback_chip_entity.dart';

part 'topic_feedback_data_entity.g.dart';

@CopyWith()
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

  bool get isNotValid =>
      (isContainOthersElement(nameFb) && nameFbDetail.trim().isEmpty) ||
      (isContainOthersElement(picFb) && picFbDetail.trim().isEmpty) ||
      (isContainOthersElement(descriptionFb) &&
          descriptionFbDetail.trim().isEmpty) ||
      (isContainOthersElement(vocabFb) && vocabFbDetail.trim().isEmpty) ||
      (isContainOthersElement(qnaFb) && qnaFbDetail.trim().isEmpty);

  bool isContainOthersElement(List<TopicFeedbackChipEntity> checkList) =>
      checkList.any(
          (element) => element.title.toUpperCase().compareTo('OTHERS') == 0);

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
