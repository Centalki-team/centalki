import 'package:equatable/equatable.dart';

class NotiListItemEntity extends Equatable {
  const NotiListItemEntity({
    this.id,
    this.createdAtTime,
    this.seenAtTime,
    this.data,
    this.title,
    this.body,
  });

  final String? id;
  final DateTime? createdAtTime;
  final DateTime? seenAtTime;
  final NotiListItemDataEntity? data;
  final NotiListItemTitleEntity? title;
  final NotiListItemBodyEntity? body;

  @override
  List<Object?> get props => [
        id,
        createdAtTime,
        seenAtTime,
        data,
        title,
        body,
      ];
}

class NotiListItemDataEntity extends Equatable {
  const NotiListItemDataEntity({
    this.sessionId,
    this.type,
  });

  final String? sessionId;
  final String? type;

  @override
  List<Object?> get props => [
        sessionId,
        type,
      ];
}

class NotiListItemTitleEntity extends Equatable {
  const NotiListItemTitleEntity({
    this.en,
  });

  final String? en;

  @override
  List<Object?> get props => [
        en,
      ];
}

class NotiListItemBodyEntity extends Equatable {
  const NotiListItemBodyEntity({
    this.en,
  });

  final String? en;

  @override
  List<Object?> get props => [
        en,
      ];
}
