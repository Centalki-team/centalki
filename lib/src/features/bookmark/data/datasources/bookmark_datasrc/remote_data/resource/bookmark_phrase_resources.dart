import '../../../../../../../../base/domain/resource.base.dart';

class CreateBookmarkPhraseResource extends Resource {
  const CreateBookmarkPhraseResource() : super('/bookmark/vocab');
}

class GetUserPhraseBookmarksResource extends Resource {
  const GetUserPhraseBookmarksResource() : super('/bookmark/vocab');
}

class GetPhraseBookmarkDetailResource extends Resource {
  const GetPhraseBookmarkDetailResource(String bookmarkId)
      : super('/bookmark/vocab/$bookmarkId');
}

class DeletePhraseBookmarkDetailResource extends Resource {
  const DeletePhraseBookmarkDetailResource(String bookmarkId)
      : super('/bookmark/vocab/$bookmarkId');
}
