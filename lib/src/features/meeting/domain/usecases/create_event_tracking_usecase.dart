import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/event_repository.dart';
import 'create_event_tracking_params.dart';

class CreateEventTrackingUseCase
    with UseCase<CreateEventTrackingParams, Either<AppException, bool>> {
  const CreateEventTrackingUseCase({
    required this.eventTrackingRepository,
  });

  final EventTrackingRepository eventTrackingRepository;

  @override
  Future<Either<AppException, bool>> execute(
          CreateEventTrackingParams params) =>
      eventTrackingRepository.createEventTracking(
        params.sessionId,
        params.event,
      );
}
