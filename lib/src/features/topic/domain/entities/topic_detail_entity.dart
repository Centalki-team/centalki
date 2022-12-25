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
  String? id;
  String? topicId;
  List<Examples>? examples;
  String? phonetic;
  List<String>? meanings;
  String? phrase;
  String? updatedAt;
  String? createdAt;

  TopicPhraseEntity({
    this.id,
    this.topicId,
    this.examples,
    this.phonetic,
    this.meanings,
    this.phrase,
    this.updatedAt,
    this.createdAt,
  });

  TopicPhraseEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topicId = json['topicId'];
    if (json['examples'] != null) {
      examples = <Examples>[];
      json['examples'].forEach((v) {
        examples!.add(Examples.fromJson(v));
      });
    }
    phonetic = json['phonetic'];
    meanings = json['meanings'].cast<String>();
    phrase = json['phrase'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['topicId'] = topicId;
    if (examples != null) {
      data['examples'] = examples!.map((v) => v.toJson()).toList();
    }
    data['phonetic'] = phonetic;
    data['meanings'] = meanings;
    data['phrase'] = phrase;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Examples {
  String? permalink;
  String? currentVote;
  String? example;
  String? author;
  String? word;
  int? thumbsUp;
  int? defid;
  int? thumbsDown;
  String? writtenOn;
  String? definition;

  Examples({
    this.permalink,
    this.currentVote,
    this.example,
    this.author,
    this.word,
    this.thumbsUp,
    this.defid,
    this.thumbsDown,
    this.writtenOn,
    this.definition,
  });

  Examples.fromJson(Map<String, dynamic> json) {
    permalink = json['permalink'];
    currentVote = json['current_vote'];
    example = json['example'];
    author = json['author'];
    word = json['word'];
    thumbsUp = json['thumbs_up'];
    defid = json['defid'];
    thumbsDown = json['thumbs_down'];
    writtenOn = json['written_on'];
    definition = json['definition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['permalink'] = permalink;
    data['current_vote'] = currentVote;
    data['example'] = example;
    data['author'] = author;
    data['word'] = word;
    data['thumbs_up'] = thumbsUp;
    data['defid'] = defid;
    data['thumbs_down'] = thumbsDown;
    data['written_on'] = writtenOn;
    data['definition'] = definition;
    return data;
  }
}
