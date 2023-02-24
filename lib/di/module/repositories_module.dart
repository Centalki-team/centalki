import '../../src/features/topics/data/datasources/topics_datasource/remote_data/topics_remote_datasource.dart';
import '../../src/features/topics/data/repositories/topic_repository_impl.dart';
import '../../src/features/topics/domain/repositories/topic_repository.dart';
import '../di_module.dart';

class RepositoriesModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<TopicRemoteDatasource>(
        TopicRemoteDatasource.new,
      )
      ..registerLazySingleton<TopicRepository>(TopicRepositoryImpl.new);
  }
}