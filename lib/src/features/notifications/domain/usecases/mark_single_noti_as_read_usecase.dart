import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/noti_list_item_entity.dart';
import '../repositories/noti_list_repository.dart';

class MarkSingleNotiAsReadUseCase
    with UseCase<String, Either<AppException, NotiListItemEntity>> {
  const MarkSingleNotiAsReadUseCase({
    required this.notiListRepository,
  });

  final NotiListRepository notiListRepository;

  @override
  Future<Either<AppException, NotiListItemEntity>> execute(String params) =>
      notiListRepository.markSingleNotiAsRead(params);
}
