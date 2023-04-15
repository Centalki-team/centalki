import '../../../../../../../../base/domain/resource.base.dart';

class BookmarkTopicResource extends Resource {
  const BookmarkTopicResource() : super('/bookmark/topic');
}

class DeleteBookmarkTopicResource extends Resource {
  DeleteBookmarkTopicResource(String bookmarkId)
      : super('/bookmark/topic/$bookmarkId');
}
