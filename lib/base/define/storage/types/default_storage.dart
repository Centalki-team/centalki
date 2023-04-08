import 'package:shared_preferences/shared_preferences.dart';

import '../storage_client.dart';

class DefaultStorage extends StorageClient {
  DefaultStorage();

  late SharedPreferences _sharedPreferences;

  @override
  Future<void> start() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future clear() => _sharedPreferences.clear();

  @override
  Future<bool?> getBool(String key) =>
      Future.value(_sharedPreferences.getBool(key));

  @override
  Future<double?> getDouble(String key) =>
      Future.value(_sharedPreferences.getDouble(key));

  @override
  Future<int?> getInt(String key) =>
      Future.value(_sharedPreferences.getInt(key));

  @override
  Future<String?> getString(String key) =>
      Future.value(_sharedPreferences.getString(key));

  @override
  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  @override
  Future<bool> putDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  @override
  Future<bool> putInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  @override
  Future<bool> putString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  @override
  Future<bool> remove(String key) => _sharedPreferences.remove(key);
}
