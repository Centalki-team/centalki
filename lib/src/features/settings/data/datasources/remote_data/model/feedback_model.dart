import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/feedback_entity.dart';

part 'feedback_model.g.dart';

@JsonSerializable(createToJson: false)
class FeedbackModel extends FeedbackEntity {
  const FeedbackModel({
    required this.rating,
    required this.text,
  }) : super(ratingValue: rating, feedback: text);

  final double rating;
  final String text;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}
