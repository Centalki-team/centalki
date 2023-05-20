abstract class ApplicationRepository {
  Future<String> getLocale();
  Future<void> setLocale(String locale);
}
