class TopicDetailEntity {
  const TopicDetailEntity({
    this.topicName,
    this.topicImage,
    this.topicDescription,
    this.topicLevel,
    this.topicCategory,
    this.topicQuestions,
    this.topicPhrases,
  });

  final String? topicName;
  final String? topicImage;
  final String? topicDescription;
  final String? topicLevel;
  final String? topicCategory;
  final List<TopicQuestionEntity>? topicQuestions;
  final List<TopicPhraseEntity>? topicPhrases;
}

class TopicQuestionEntity {
  const TopicQuestionEntity({this.questionContent});

  final String? questionContent;
}

class TopicPhraseEntity {
  const TopicPhraseEntity({
    this.topicPhrase,
    this.phraseTranslations,
    this.phraseExamples,
  });

  final String? topicPhrase;
  final List<PhraseTranslationEntity>? phraseTranslations;
  final List<PhraseExampleEntity>? phraseExamples;
}

class PhraseExampleEntity {
  const PhraseExampleEntity({this.phraseExample});

  final String? phraseExample;
}

class PhraseTranslationEntity {
  const PhraseTranslationEntity({this.phraseMeaning});

  final String? phraseMeaning;
}
