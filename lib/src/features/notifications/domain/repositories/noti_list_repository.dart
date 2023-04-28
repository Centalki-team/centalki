import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/noti_list_item_entity.dart';
import '../entities/noti_list_response_entity.dart';

abstract class NotiListRepository {
  Future<Either<AppException, NotiListResponseEntity>> getNotiList(
      Map<String, dynamic> params);
  Future<Either<AppException, NotiListItemEntity>> markSingleNotiAsRead(
      String params);
}
