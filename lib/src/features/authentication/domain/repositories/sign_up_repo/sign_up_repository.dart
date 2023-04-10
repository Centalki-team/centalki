import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';

abstract class SignUpRepository {
  Future<Either<AppException, bool>> signUpSetUpInitLevel(Map<String, dynamic> params);
}
