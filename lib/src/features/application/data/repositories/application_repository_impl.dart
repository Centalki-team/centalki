import '../../../../../di/di_module.dart';
import '../../domain/repositories/application_repository.dart';
import '../datasources/local_data/application_local_datasrc/application_local_datasource.dart';

class ApplicationRepositoryImpl extends ApplicationRepository {
  ApplicationRepositoryImpl();

  final ApplicationLocalDatasource _applicationLocalDatasource =
      getIt.get<ApplicationLocalDatasource>();

  @override
  Future<String> getLocale() => _applicationLocalDatasource.getLocale();

  @override
  Future<void> setLocale(String locale) =>
      _applicationLocalDatasource.setLocale(locale);

  @override
  Future<bool> checkThemeIsDark() =>
      _applicationLocalDatasource.checkThemeIsDark();

  @override
  Future<void> setTheme({bool isDark = false}) =>
      _applicationLocalDatasource.setTheme(isDark: isDark);
}
