import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';
import '../../../domain/repositories/self_review_repo/self_review_repository.dart';
import '../../datasources/remote_data/self_review_remote_datasrc/self_review_remote_datasrc.dart';

class SelfReviewRepositoryImpl extends SelfReviewRepository {
  SelfReviewRepositoryImpl();

  final SelfReviewRemoteDatasource _selfReviewRemoteDatasource =
      getIt.get<SelfReviewRemoteDatasource>();

  @override
  Future<Either<AppException, List<SelfLevelEntity>>> getLevelsList() async {
    try {
      final result = await _selfReviewRemoteDatasource.getLevelLists();
      return Right(result);
    } on AppException catch (s) {
      return Left(AppException(error: s));
    } catch (e) {
      return Left(AppException(error: e));
    }
  }
}
