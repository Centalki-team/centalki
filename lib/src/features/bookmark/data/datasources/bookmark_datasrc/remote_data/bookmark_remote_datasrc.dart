import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../shared/extensions.dart';
import 'model/bookmark_phrase_model.dart';
import 'resource/bookmark_phrase_resources.dart';

class BookmarkRemoteDatasource {
  BookmarkRemoteDatasource();

  final _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<BookmarkPhraseModel> createPhraseBookmark(
      Map<String, dynamic> params) async {
    final response = await _apiGateway.execute(
      resource: const CreateBookmarkPhraseResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return BookmarkPhraseModel.fromJson(response.data);
  }

  Future<bool> deletePhraseBookmark(String params) async {
    final response = await _apiGateway.execute(
      resource: DeletePhraseBookmarkDetailResource(params),
      method: HTTPMethod.delete,
    );
    return response.isOk;
  }
}
