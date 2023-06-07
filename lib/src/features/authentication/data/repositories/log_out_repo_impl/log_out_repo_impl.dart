import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/repositories/log_out_repo/log_out_repository.dart';
import '../../datasources/remote_data/log_out_remote_datasrc/log_out_remote_datasrc.dart';

class LogOutRepositoryImpl extends LogOutRepository {
  LogOutRepositoryImpl();

  final LogOutRemoteDatasource _logOutRemoteDatasource =
      getIt.get<LogOutRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> logOut(Map<String, dynamic> params) async {
    try {
      final res = await _logOutRemoteDatasource.logOut(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(error: e));
    }
  }
}
