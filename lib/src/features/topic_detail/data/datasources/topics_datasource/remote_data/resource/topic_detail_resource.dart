import '../../../../../../../../base/domain/resource.base.dart';

class TopicDetailResource extends Resource {
  const TopicDetailResource(String topicId) : super('/topic/$topicId');
}
