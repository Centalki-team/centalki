class TopicDetailEntity {
  const TopicDetailEntity({
    this.topicId,
    this.topicName,
    this.topicImage,
    this.topicDescription,
    this.topicLevel,
    this.topicCategory,
    this.topicQuestions,
    this.topicPhrases,
  });

  final String? topicId;
  final String? topicName;
  final String? topicImage;
  final String? topicDescription;
  final String? topicLevel;
  final String? topicCategory;
  final List<TopicQuestionEntity>? topicQuestions;
  final List<TopicPhraseEntity>? topicPhrases;
}

class TopicQuestionEntity {
  const TopicQuestionEntity({this.questionContent, this.topicAnswers});

  final String? questionContent;
  final List<QuestionAnswerEntity>? topicAnswers;
}

class TopicPhraseEntity {
  const TopicPhraseEntity({
    this.topicPhrase,
    this.phrasePhonetic,
    this.phraseTranslations,
    this.phraseExamples,
  });

  final String? topicPhrase;
  final String? phrasePhonetic;
  final List<PhraseTranslationEntity>? phraseTranslations;
  final List<PhraseExampleEntity>? phraseExamples;
}

class QuestionAnswerEntity {
  const QuestionAnswerEntity({this.questionAnswer});

  final String? questionAnswer;
}

class PhraseExampleEntity {
  const PhraseExampleEntity({this.phraseExample});

  final String? phraseExample;
}

class PhraseTranslationEntity {
  const PhraseTranslationEntity({this.phraseMeaning});

  final String? phraseMeaning;
}
