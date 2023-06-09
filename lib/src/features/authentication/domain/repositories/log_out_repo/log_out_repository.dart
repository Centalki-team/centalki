import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';

abstract class LogOutRepository {
  Future<Either<AppException, bool>> logOut(Map<String, dynamic> params);
}
