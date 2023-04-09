import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../../entities/self_review/self_level_entity.dart';
import '../../repositories/self_review_repo/self_review_repository.dart';

class GetLevelsUseCase
    with UseCase<void, Either<AppException, List<SelfLevelEntity>>> {
  const GetLevelsUseCase({
    required this.selfReviewRepository,
  });

  final SelfReviewRepository selfReviewRepository;

  @override
  Future<Either<AppException, List<SelfLevelEntity>>> execute(void params) =>
      selfReviewRepository.getLevelsList();
}
