import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../../topics/domain/entities/topic_item_entity.dart';
import '../../domain/repositories/search_topics_repository.dart';
import '../datasources/search_topics_datasrc/remote_data/search_topics_remote_datasrc.dart';

class SearchTopicsRepositoryImpl extends SearchTopicsRepository {
  SearchTopicsRepositoryImpl();

  final _searchTopicsRemoteDatasource =
      getIt.get<SearchTopicsRemoteDatasource>();

  @override
  Future<Either<AppException, TopicsListEntity>> searchTopics(
      Map<String, dynamic> params) async {
    try {
      final res = await _searchTopicsRemoteDatasource.searchTopics(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(error: e));
    }
  }
}
