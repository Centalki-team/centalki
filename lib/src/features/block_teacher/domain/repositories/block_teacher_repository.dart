import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';

abstract class BlockTeacherRepository {
  Future<Either<AppException, bool>> blockTeacher(String teacherId);
}
