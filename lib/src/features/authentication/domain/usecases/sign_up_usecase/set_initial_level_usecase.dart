import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../../repositories/sign_up_repo/sign_up_repository.dart';
import 'params/set_initial_level_params.dart';

class SetInitialLevelUseCase
    with UseCase<SetInitialLevelUseCaseParams, Either<AppException, bool>> {
  const SetInitialLevelUseCase({
    required this.signUpRepository,
  });

  final SignUpRepository signUpRepository;

  @override
  Future<Either<AppException, bool>> execute(
          SetInitialLevelUseCaseParams params) =>
      signUpRepository.signUpSetUpInitLevel(params.toJson());
}
