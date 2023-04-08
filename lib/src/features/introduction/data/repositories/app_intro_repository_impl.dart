import '../../../../../di/di_module.dart';
import '../../domain/entities/app_intro_entity.dart';
import '../../domain/repositories/app_intro_repository.dart';
import '../datasources/local_data/intro_local_datasource.dart';

class AppIntroRepositoryImpl extends AppIntroRepository {
  AppIntroRepositoryImpl();

  final IntroLocalDatasource introLocalDatasource =
      getIt.get<IntroLocalDatasource>();

  @override
  Future<List<AppIntroEntity>> getAppIntros() =>
      introLocalDatasource.getAppIntroduction();

  @override
  Future<bool> getStatusAppIntroFirstTime() =>
      introLocalDatasource.getStatusAppIntroFirstTime();

  @override
  Future<void> saveStatusAppIntroFirstTime() =>
      introLocalDatasource.saveStatusAppIntroFirstTime();
}
