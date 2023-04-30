import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/topic_suggestion_content_entity.dart';
import '../../domain/repositories/topic_suggestion_repository.dart';
import '../datasources/local_data/topic_suggestion_content_local_datasource.dart';
import '../datasources/remote_data/topic_suggestion_remote_datasource.dart';

class TopicSuggestionRepositoryImpl extends TopicSuggestionRepository {
  TopicSuggestionRepositoryImpl();

  final topicSuggestionContentLocalDatasrc =
      getIt.get<TopicSuggestionContentLocalDataSource>();

  final topicSuggestionRemoteDatasrc =
      getIt.get<TopicSuggestionRemoteDatasrc>();

  @override
  Future<Either<AppException, List<TopicSuggestionContentEntity>>>
      getTopicSuggestionContents() async {
    try {
      final res =
          await topicSuggestionContentLocalDatasrc.getTopicSuggestionContents();
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> sendTopicSuggetion(
      Map<String, dynamic> params) async {
    try {
      final res =
          await topicSuggestionRemoteDatasrc.sendTopicSuggestion(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
}
