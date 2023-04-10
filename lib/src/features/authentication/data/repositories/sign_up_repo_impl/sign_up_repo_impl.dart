import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../../domain/repositories/sign_up_repo/sign_up_repository.dart';
import '../../datasources/remote_data/sign_up_remote_datasrc/sign_up_remote_datasrc.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  SignUpRepositoryImpl();

  final SignUpRemoteDatasource _signUpRemoteDatasource =
      getIt.get<SignUpRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> signUpSetUpInitLevel(
      Map<String, dynamic> params) async {
    try {
      final res = await _signUpRemoteDatasource.setUpInitialLevel(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(error: e));
    }
  }
}
