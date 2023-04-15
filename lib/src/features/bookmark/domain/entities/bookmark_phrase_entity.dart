import 'package:equatable/equatable.dart';

class BookmarkPhraseEntity extends Equatable {
  const BookmarkPhraseEntity({
    this.id,
    this.phraseId,
    this.userId,
    this.createdAtTime,
  });

  final String? id;
  final String? phraseId;
  final String? userId;
  final DateTime? createdAtTime;

  @override
  List<Object?> get props => [
        id,
        phraseId,
        userId,
        createdAtTime,
      ];
}
