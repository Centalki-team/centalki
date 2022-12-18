class TopicDetail {
  String? id;
  String? levelId;
  String? categoryId;
  String? name;
  String? imageURL;
  String? description;
  Level? level;
  Category? category;
  List<Question>? questions;
  List<Phrase>? phrases;

  TopicDetail({
    this.id,
    this.levelId,
    this.categoryId,
    this.name,
    this.imageURL,
    this.description,
    this.level,
    this.category,
    this.questions,
    this.phrases,
  });

  TopicDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelId = json['levelId'];
    categoryId = json['categoryId'];
    name = json['name'];
    imageURL = json['imageURL'];
    description = json['description'];
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
    if (json['phrases'] != null) {
      phrases = <Phrase>[];
      json['phrases'].forEach((v) {
        phrases!.add(Phrase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['levelId'] = levelId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['imageURL'] = imageURL;
    data['description'] = description;
    if (level != null) {
      data['level'] = level!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (phrases != null) {
      data['phrases'] = phrases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Level {
  String? id;
  String? name;
  String? code;

  Level({this.id, this.name, this.code});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Question {
  String? id;
  String? question;
  String? topicId;

  Question({this.id, this.question, this.topicId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    topicId = json['topicId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['question'] = question;
    data['topicId'] = topicId;
    return data;
  }
}

class Phrase {
  String? id;
  String? topicId;
  List<Examples>? examples;
  String? phonetic;
  List<String>? meanings;
  String? phrase;
  String? updatedAt;
  String? createdAt;

  Phrase({
    this.id,
    this.topicId,
    this.examples,
    this.phonetic,
    this.meanings,
    this.phrase,
    this.updatedAt,
    this.createdAt,
  });

  Phrase.fromJson(Map<String, dynamic> json) {
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
