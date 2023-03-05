import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_datasource/remote_data/event_remote_datasource.dart';

class EventTrackingRepositoryImpl extends EventTrackingRepository {
  EventTrackingRepositoryImpl();

  final EventTrackingRemoteDatasource eventTrackingRemoteDatasource =
      getIt.get<EventTrackingRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> createEventTracking(
      String sessionId, String name) async {
    try {
      final result = await eventTrackingRemoteDatasource.createEventTracking(
          sessionId, name);
      return Right(result);
    } on AppException catch (a) {
      return Left(a);
    } on Exception catch (e) {
      return Left(AppException(
        error: e,
        displayMessage: "Chưa thể ghi nhận sự kiện",
      ));
    }
  }
}
