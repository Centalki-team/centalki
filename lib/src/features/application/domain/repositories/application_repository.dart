abstract class ApplicationRepository {
  Future<String> getLocale();
  Future<void> setLocale(String locale);
  Future<bool> checkThemeIsDark();
  Future<void> setTheme({bool isDark = false});
}
