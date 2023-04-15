import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../base/helpers/time_helper.dart';
import '../../../../../domain/entities/bookmark_phrase_entity.dart';

part 'bookmark_phrase_model.g.dart';

@JsonSerializable(createToJson: false)
class BookmarkPhraseModel extends BookmarkPhraseEntity {
  const BookmarkPhraseModel({
    String? id,
    String? phraseId,
    String? userId,
    this.createdAt,
  }) : super(
          id: id,
          phraseId: phraseId,
          userId: userId,
          createdAtTime: createdAt,
        );

  @JsonKey(fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;

  factory BookmarkPhraseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkPhraseModelFromJson(json);
}
