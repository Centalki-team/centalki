import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/noti_list_repository.dart';

class MarkAllNotiAsReadUseCase
    with UseCase<void, Either<AppException, bool>> {
  const MarkAllNotiAsReadUseCase({
    required this.notiListRepository,
  });

  final NotiListRepository notiListRepository;

  @override
  Future<Either<AppException, bool>> execute(void params) =>
      notiListRepository.markAllNotiAsRead();
}
