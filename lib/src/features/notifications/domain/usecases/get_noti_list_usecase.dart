import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/noti_list_response_entity.dart';
import '../repositories/noti_list_repository.dart';
import 'params/get_noti_list_param.dart';

class GetNotiListUseCase
    with
        UseCase<GetNotiListParam,
            Either<AppException, NotiListResponseEntity>> {
  const GetNotiListUseCase({
    required this.notiListRepository,
  });

  final NotiListRepository notiListRepository;

  @override
  Future<Either<AppException, NotiListResponseEntity>> execute(
          GetNotiListParam params) =>
      notiListRepository.getNotiList(params.toJson());
}
