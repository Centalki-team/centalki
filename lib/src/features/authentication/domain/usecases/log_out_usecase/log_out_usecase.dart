import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../../repositories/log_out_repo/log_out_repository.dart';
import 'params/log_out_params.dart';

class LogOutUseCase
    with UseCase<LogOutUseCaseParams, Either<AppException, bool>> {
  const LogOutUseCase({
    required this.logOutRepository,
  });

  final LogOutRepository logOutRepository;

  @override
  Future<Either<AppException, bool>> execute(LogOutUseCaseParams params) =>
      logOutRepository.logOut(params.toJson());
}
