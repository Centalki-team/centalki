import 'package:equatable/equatable.dart';

class TopicFeedbackPageEntity extends Equatable {
  const TopicFeedbackPageEntity({
    required this.pageTitle,
    required this.contentChips,
    required this.textAreaHint,
  });

  final String pageTitle;
  final List<String> contentChips;
  final String textAreaHint;

  @override
  List<Object?> get props => [
        pageTitle,
        contentChips,
        textAreaHint,
      ];
}
