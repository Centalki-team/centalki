class SessionFeedbackContentBaseEntity {
  const SessionFeedbackContentBaseEntity({this.contents});

  final SessionFeedbackContentEntity? contents;
}

class SessionFeedbackContentEntity {
  const SessionFeedbackContentEntity({
    this.positiveContents,
    this.negativeContents,
  });

  final List<SessionFeedbackContentItemEntity>? positiveContents;
  final List<SessionFeedbackContentItemEntity>? negativeContents;
}

class SessionFeedbackContentItemEntity {
  const SessionFeedbackContentItemEntity({
    this.contentTitle,
    this.contentKey,
  });

  final String? contentTitle;
  final String? contentKey;
}
