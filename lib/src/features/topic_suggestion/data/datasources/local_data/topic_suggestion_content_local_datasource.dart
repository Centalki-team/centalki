import '../../../domain/entities/topic_suggestion_content_entity.dart';

class TopicSuggestionContentLocalDataSource {
  const TopicSuggestionContentLocalDataSource();

  Future<List<TopicSuggestionContentEntity>>
      getTopicSuggestionContents() async => const [
            TopicSuggestionContentEntity(
              key: "ELEMENTARY",
              title: "Elementary",
            ),
            TopicSuggestionContentEntity(
              key: "PRE_INTERMEDIATE",
              title: "Pre-Intermediate",
            ),
            TopicSuggestionContentEntity(
              key: "INTERMEDIATE",
              title: "Intermediate",
            ),
            TopicSuggestionContentEntity(
              key: "UPPER_INTERMEDIATE",
              title: "Upper-Intermediate",
            ),
            TopicSuggestionContentEntity(
              key: "NOT_TOO_HARD",
              title: "Shouldn't be too hard",
            ),
            TopicSuggestionContentEntity(
              key: "NOT_TOO_EASY",
              title: "Shouldn't be too easy",
            ),
            TopicSuggestionContentEntity(
              key: "NOT_SURE",
              title: "I'm not sure, any level would be fine",
            ),
          ];
}
