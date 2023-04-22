import 'package:equatable/equatable.dart';

class TopicFeedbackChipEntity extends Equatable {
  const TopicFeedbackChipEntity({
    required this.key,
    required this.title,
  });

  final String key;
  final String title;

  @override
  List<Object?> get props => [
        key,
        title,
      ];
}
