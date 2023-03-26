import '../../src/features/meeting/data/datasources/event_datasource/remote_data/event_remote_datasource.dart';
import '../../src/features/meeting/data/repositories/event_repository_impl.dart';
import '../../src/features/meeting/domain/repositories/event_repository.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource_auth_required.dart';
import '../../src/features/payment/data/repositories/payment_repository_impl.dart';
import '../../src/features/payment/domain/repositories/payment_repository.dart';
import '../../src/features/settings/data/datasources/remote_data/feedback_remote_datasource.dart';
import '../../src/features/settings/data/repositories/feedback_repository_impl.dart';
import '../../src/features/settings/domain/repositories/feedback_repository.dart';
import '../../src/features/topics/data/datasources/topics_datasource/remote_data/topics_remote_datasource.dart';
import '../../src/features/topics/data/repositories/topic_repository_impl.dart';
import '../../src/features/topics/domain/repositories/topic_repository.dart';
import '../di_module.dart';

class RepositoriesModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      //Datasources
      ..registerLazySingleton<TopicRemoteDatasource>(TopicRemoteDatasource.new)
      ..registerLazySingleton<EventTrackingRemoteDatasource>(
          EventTrackingRemoteDatasource.new)
      ..registerLazySingleton<PaymentRemoteDatasource>(
          PaymentRemoteDatasource.new)
      ..registerLazySingleton<PaymentRemoteDatasourceAuthRequired>(
          PaymentRemoteDatasourceAuthRequired.new)
      ..registerLazySingleton<FeedbackRemoteDatasource>(
        FeedbackRemoteDatasource.new,
      )
      //Repositories
      ..registerLazySingleton<TopicRepository>(TopicRepositoryImpl.new)
      ..registerLazySingleton<EventTrackingRepository>(
          EventTrackingRepositoryImpl.new)
      ..registerLazySingleton<PaymentRepository>(PaymentRepositoryImpl.new)
      ..registerLazySingleton<FeedbackRepository>(
        FeedbackRepositoryImpl.new,
      );
  }
}
