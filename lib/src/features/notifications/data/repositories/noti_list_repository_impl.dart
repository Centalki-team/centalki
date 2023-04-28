import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/noti_list_item_entity.dart';
import '../../domain/entities/noti_list_response_entity.dart';
import '../../domain/repositories/noti_list_repository.dart';
import '../datasources/noti_datasrc/remote_data/noti_remote_datasrc.dart';

class NotiListRepositoryImpl extends NotiListRepository {
  NotiListRepositoryImpl();

  final _notiRemoteDatasrc = getIt.get<NotiRemoteDatasource>();

  @override
  Future<Either<AppException, NotiListResponseEntity>> getNotiList(
      Map<String, dynamic> params) async {
    try {
      final result = await _notiRemoteDatasrc.getNotiList(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Error while getting notifications list',
      ));
    }
  }

  @override
  Future<Either<AppException, NotiListItemEntity>> markSingleNotiAsRead(String params) async {
    try {
      final result = await _notiRemoteDatasrc.markSingleNotiAsRead(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Error while marking notification as read',
      ));
    }
  }
  
  @override
  Future<Either<AppException, bool>> markAllNotiAsRead() async {
    try {
      final result = await _notiRemoteDatasrc.markAllNotiAsRead();
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Error while marking all notifications as read',
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> markAllNotiAsUnread() async {
    try {
      final result = await _notiRemoteDatasrc.markAllNotiAsUnread();
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: 'Error while marking all notifications as unread',
      ));
    }
  }
}
