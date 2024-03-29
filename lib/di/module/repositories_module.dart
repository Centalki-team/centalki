import '../../base/define/storage/storage_gateway.dart';
import '../../src/features/application/data/datasources/local_data/application_local_datasrc/application_local_datasource.dart';
import '../../src/features/application/data/repositories/application_repository_impl.dart';
import '../../src/features/application/domain/repositories/application_repository.dart';
import '../../src/features/application/presentation/blocs/application_bloc/application_bloc.dart';
import '../../src/features/authentication/data/datasources/remote_data/log_out_remote_datasrc/log_out_remote_datasrc.dart';
import '../../src/features/authentication/data/datasources/remote_data/self_review_remote_datasrc/self_review_remote_datasrc.dart';
import '../../src/features/authentication/data/datasources/remote_data/sign_up_remote_datasrc/sign_up_remote_datasrc.dart';
import '../../src/features/authentication/data/repositories/log_out_repo_impl/log_out_repo_impl.dart';
import '../../src/features/authentication/data/repositories/self_review_repo_impl/self_review_repo_impl.dart';
import '../../src/features/authentication/data/repositories/sign_up_repo_impl/sign_up_repo_impl.dart';
import '../../src/features/authentication/domain/repositories/log_out_repo/log_out_repository.dart';
import '../../src/features/authentication/domain/repositories/self_review_repo/self_review_repository.dart';
import '../../src/features/authentication/domain/repositories/sign_up_repo/sign_up_repository.dart';
import '../../src/features/bookmark/data/datasources/bookmark_datasrc/remote_data/bookmark_remote_datasrc.dart';
import '../../src/features/bookmark/data/repositories/bookmark_repository_impl.dart';
import '../../src/features/bookmark/domain/repositories/bookmark_repository.dart';
import '../../src/features/bookmark/topic/data/datasources/remote_data/bookmark_topic_remote_datasource.dart';
import '../../src/features/bookmark/topic/data/repositories/bookmark_topic_repository_impl.dart';
import '../../src/features/bookmark/topic/domain/repositories/bookmark_topic_repository.dart';
import '../../src/features/check_ongoing_session/presentation/blocs/ongoing_session_bloc/ongoing_session_bloc.dart';
import '../../src/features/introduction/data/datasources/local_data/intro_local_datasource.dart';
import '../../src/features/introduction/data/repositories/app_intro_repository_impl.dart';
import '../../src/features/introduction/domain/repositories/app_intro_repository.dart';
import '../../src/features/meeting/data/datasources/event_datasource/remote_data/event_remote_datasource.dart';
import '../../src/features/meeting/data/repositories/event_repository_impl.dart';
import '../../src/features/meeting/domain/repositories/event_repository.dart';
import '../../src/features/notifications/data/datasources/noti_datasrc/remote_data/noti_remote_datasrc.dart';
import '../../src/features/notifications/data/repositories/noti_list_repository_impl.dart';
import '../../src/features/notifications/domain/repositories/noti_list_repository.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource.dart';
import '../../src/features/payment/data/datasources/remote_data/payment_remote_datasource_auth_required.dart';
import '../../src/features/payment/data/repositories/payment_repository_impl.dart';
import '../../src/features/payment/domain/repositories/payment_repository.dart';
import '../../src/features/report_meeting/data/datasources/report_meeting_datasource/remote_data/report_meeting_remote_datasource.dart';
import '../../src/features/report_meeting/data/repositories/report_meeting_repository_impl.dart';
import '../../src/features/report_meeting/domain/repositories/report_meeting_repository.dart';
import '../../src/features/search_topics/data/datasources/search_topics_datasrc/remote_data/search_topics_remote_datasrc.dart';
import '../../src/features/search_topics/data/repositories/search_topics_repository_impl.dart';
import '../../src/features/search_topics/domain/repositories/search_topics_repository.dart';
import '../../src/features/session_feedback/data/datasources/remote_data/session_feedback_remote_datasource.dart';
import '../../src/features/session_feedback/data/repositories/session_feedback_repository_impl.dart';
import '../../src/features/session_feedback/domain/repositories/session_feedback_repository.dart';
import '../../src/features/settings/data/datasources/remote_data/feedback_remote_datasource.dart';
import '../../src/features/settings/data/repositories/feedback_repository_impl.dart';
import '../../src/features/settings/domain/repositories/feedback_repository.dart';
import '../../src/features/topic_detail/data/datasources/topics_datasource/remote_data/topic_detail_remote_datasource.dart';
import '../../src/features/topic_detail/data/repositories/topic_detail_repository_impl.dart';
import '../../src/features/topic_detail/domain/repositories/topic_detail_repository.dart';
import '../../src/features/topic_review/data/datasources/topic_review_page_content/remote_data/topic_review_page_content_remote_datasrc.dart';
import '../../src/features/topic_review/data/repositories/topic_review_pages_repository_impl.dart';
import '../../src/features/topic_review/domain/repositories/topic_review_pages_repository.dart';
import '../../src/features/topic_suggestion/data/datasources/local_data/topic_suggestion_content_local_datasource.dart';
import '../../src/features/topic_suggestion/data/datasources/remote_data/topic_suggestion_remote_datasource.dart';
import '../../src/features/topic_suggestion/data/repositories/topic_suggestion_repository_impl.dart';
import '../../src/features/topic_suggestion/domain/repositories/topic_suggestion_repository.dart';
import '../../src/features/topics/data/datasources/topics_datasource/remote_data/topics_remote_datasource.dart';
import '../../src/features/topics/data/repositories/topic_repository_impl.dart';
import '../../src/features/topics/domain/repositories/topic_repository.dart';
import '../../src/features/tracking/tracking.dart';
import '../di_module.dart';

class RepositoriesModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      //Datasources
      ..registerLazySingleton<TopicRemoteDatasource>(TopicRemoteDatasource.new)
      ..registerLazySingleton<TopicDetailRemoteDatasource>(
          TopicDetailRemoteDatasource.new)
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
      ..registerLazySingleton<BookmarkRemoteDatasource>(
          BookmarkRemoteDatasource.new)
      ..registerLazySingleton<BookmarkTopicRemoteDatasource>(
          BookmarkTopicRemoteDatasource.new)
      ..registerLazySingleton<SearchTopicsRemoteDatasource>(
          SearchTopicsRemoteDatasource.new)
      ..registerLazySingleton<SessionFeedbackRemoteDatasource>(
          SessionFeedbackRemoteDatasource.new)
      ..registerLazySingleton<TopicReviewPageContentsRemoteDatasrc>(
          TopicReviewPageContentsRemoteDatasrc.new)
      ..registerLazySingleton<NotiRemoteDatasource>(NotiRemoteDatasource.new)
      ..registerLazySingleton<TopicSuggestionContentLocalDataSource>(
          TopicSuggestionContentLocalDataSource.new)
      ..registerLazySingleton<TopicSuggestionRemoteDatasrc>(
          TopicSuggestionRemoteDatasrc.new)
      ..registerLazySingleton<ApplicationLocalDatasource>(
        () => ApplicationLocalDatasource(
          storageGateway: StorageGateway.defaultGateway(),
        ),
      )
      ..registerLazySingleton<LogOutRemoteDatasource>(
          LogOutRemoteDatasource.new)
      //Repositories
      ..registerLazySingleton<TopicRepository>(TopicRepositoryImpl.new)
      ..registerLazySingleton<TopicDetailRepository>(
          TopicDetailRepositoryImpl.new)
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
      ..registerLazySingleton<SignUpRepository>(SignUpRepositoryImpl.new)
      ..registerLazySingleton<BookmarkRepository>(BookmarkRepositoryImpl.new)
      ..registerLazySingleton<BookmarkTopicRepository>(
          BookmarkTopicRepositoryImpl.new)
      ..registerLazySingleton<SearchTopicsRepository>(
          SearchTopicsRepositoryImpl.new)
      ..registerLazySingleton<SessionFeedbackRepository>(
          SessionFeedbackRepositoryImpl.new)
      ..registerLazySingleton<TopicReviewPagesRepository>(
          TopicReviewPagesRepositoryImpl.new)
      ..registerLazySingleton<NotiListRepository>(NotiListRepositoryImpl.new)
      ..registerLazySingleton<TopicSuggestionRepository>(
          TopicSuggestionRepositoryImpl.new)
      ..registerLazySingleton<ApplicationRepository>(
          ApplicationRepositoryImpl.new)
      ..registerLazySingleton<LogOutRepository>(LogOutRepositoryImpl.new)
      // BLOCS
      ..registerSingleton<ApplicationBloc>(ApplicationBloc())
      ..registerSingleton<OngoingSessionBloc>(OngoingSessionBloc())
      ..registerSingleton<Analytics>(Analytics(ecommerce: FirebaseAnalyticsEcommerce.tryInit(),),);
  }
}
