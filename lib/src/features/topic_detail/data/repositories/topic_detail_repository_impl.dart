import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/topic_detail_entity.dart';
import '../../domain/repositories/topic_detail_repository.dart';
import '../datasources/topics_datasource/remote_data/topic_detail_remote_datasource.dart';

class TopicDetailRepositoryImpl extends TopicDetailRepository {
  TopicDetailRepositoryImpl();

  final _topicDetailRemoteDatasrc = getIt.get<TopicDetailRemoteDatasource>();

  @override
  Future<Either<AppException, TopicDetailEntity>> getTopicDetail(
      String topicId) async {
    try {
      final result = await _topicDetailRemoteDatasrc.getTopicDetail(topicId);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
}
