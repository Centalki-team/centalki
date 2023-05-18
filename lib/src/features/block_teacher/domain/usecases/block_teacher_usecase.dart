import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/block_teacher_repository.dart';

class BlockTeacherUseCase with UseCase<String, Either<AppException, bool>> {
  const BlockTeacherUseCase({
    required this.blockTeacherRepository,
  });

  final BlockTeacherRepository blockTeacherRepository;

  @override
  Future<Either<AppException, bool>> execute(String params) =>
      blockTeacherRepository.blockTeacher(params);
}
