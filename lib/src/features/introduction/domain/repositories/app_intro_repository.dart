import '../entities/app_intro_entity.dart';

abstract class AppIntroRepository {
  Future<List<AppIntroEntity>> getAppIntros();

  Future<bool> getStatusAppIntroFirstTime();

  Future<void> saveStatusAppIntroFirstTime();
}
