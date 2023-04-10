import '../../base/define/storage/storage_gateway.dart';
import '../../src/features/authentication/data/datasources/remote_data/self_review_remote_datasrc/self_review_remote_datasrc.dart';
import '../../src/features/authentication/data/datasources/remote_data/sign_up_remote_datasrc/sign_up_remote_datasrc.dart';
import '../../src/features/authentication/data/repositories/self_review_repo_impl/self_review_repo_impl.dart';
import '../../src/features/authentication/data/repositories/sign_up_repo_impl/sign_up_repo_impl.dart';
import '../../src/features/authentication/domain/repositories/self_review_repo/self_review_repository.dart';
import '../../src/features/authentication/domain/repositories/sign_up_repo/sign_up_repository.dart';
import '../../src/features/introduction/data/datasources/local_data/intro_local_datasource.dart';
import '../../src/features/introduction/data/repositories/app_intro_repository_impl.dart';
import '../../src/features/introduction/domain/repositories/app_intro_repository.dart';
import '../../src/features/meeting/data/datasources/event_datasource/remote_data/event_remote_datasource.dart';
import '../../src/features/meeting/data/repositories/event_repository_impl.dart';
import '../../src/features/meeting/domain/repositories/event_repository.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource_auth_required.dart';
import '../../src/features/payment/data/repositories/payment_repository_impl.dart';
import '../../src/features/payment/domain/repositories/payment_repository.dart';
import '../../src/features/report_meeting/data/datasources/report_meeting_datasource/remote_data/report_meeting_remote_datasource.dart';
import '../../src/features/report_meeting/data/repositories/report_meeting_repository_impl.dart';
import '../../src/features/report_meeting/domain/repositories/report_meeting_repository.dart';
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
      ..registerLazySingleton<ReportMeetingRemoteDatasource>(
        ReportMeetingRemoteDatasource.new,
      )
      ..registerLazySingleton<IntroLocalDatasource>(
        () => IntroLocalDatasource(
          storageGateway: StorageGateway.defaultGateway(),
        ),
      )
      ..registerLazySingleton<SelfReviewRemoteDatasource>(
          SelfReviewRemoteDatasource.new)
      ..registerLazySingleton<SignUpRemoteDatasource>(
          SignUpRemoteDatasource.new)
      //Repositories
      ..registerLazySingleton<TopicRepository>(TopicRepositoryImpl.new)
      ..registerLazySingleton<EventTrackingRepository>(
          EventTrackingRepositoryImpl.new)
      ..registerLazySingleton<PaymentRepository>(
        PaymentRepositoryImpl.new,
      )
      ..registerLazySingleton<FeedbackRepository>(
        FeedbackRepositoryImpl.new,
      )
      ..registerLazySingleton<ReportMeetingRepository>(
        ReportMeetingRepositoryImpl.new,
      )
      ..registerLazySingleton<AppIntroRepository>(AppIntroRepositoryImpl.new)
      ..registerLazySingleton<SelfReviewRepository>(
          SelfReviewRepositoryImpl.new)
      ..registerLazySingleton<SignUpRepository>(SignUpRepositoryImpl.new);
  }
}
