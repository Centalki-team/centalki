import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/topic_item_entity.dart';
import '../../domain/repositories/topic_repository.dart';
import '../datasources/topics_datasource/remote_data/topics_remote_datasource.dart';

class TopicRepositoryImpl extends TopicRepository {
  TopicRepositoryImpl();

  final TopicRemoteDatasource topicRemoteDatasource =
      getIt.get<TopicRemoteDatasource>();

  @override
  Future<Either<AppException, TopicsListEntity>> getTopics() async {
    try {
      final result = await topicRemoteDatasource.getTopics();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Lỗi lấy danh sách topic',
        ),
      );
    }
  }
}
