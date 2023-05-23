import '../../../../../../../base/define/storage/storage_gateway.dart';
import '../../../../../../shared/constants.dart';

class ApplicationLocalDatasource {
  const ApplicationLocalDatasource({
    required this.storageGateway,
  });

  final StorageGateway storageGateway;

  Future<String> getLocale() async {
    final res = await storageGateway.getString(StorageConstants.localeKey);
    return res ?? 'en';
  }

  Future<void> setLocale(String locale) async {
    await storageGateway.putString(StorageConstants.localeKey, locale);
  }

  Future<bool> checkThemeIsDark() async {
    final res = await storageGateway.getBool(StorageConstants.themeKey);
    return res ?? false;
  }

  Future<void> setTheme({bool isDark = false}) async {
    await storageGateway.putBool(StorageConstants.themeKey, isDark);
  }
}
