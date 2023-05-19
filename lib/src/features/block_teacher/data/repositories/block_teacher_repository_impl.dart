import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/repositories/block_teacher_repository.dart';
import '../datasource/remote_data/block_teacher_remote_datasource.dart';

class BlockTeacherRepositoryImpl extends BlockTeacherRepository {
  BlockTeacherRepositoryImpl();

  final BlockTeacherRemoteDatasource blockTeacherRemoteDatasource =
      getIt.get<BlockTeacherRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> blockTeacher(String teacherId) async {
    try {
      final result = await blockTeacherRemoteDatasource.blockTeacher(teacherId);
      return Right(result);
    } on AppException catch (a) {
      return Left(a);
    } on Exception catch (e) {
      return Left(
        AppException(
          error: e,
          displayMessage: "You can not block this teacher",
        ),
      );
    }
  }
}
