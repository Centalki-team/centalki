import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storage_client.dart';

class SecureStorage extends StorageClient {
  SecureStorage();

  late FlutterSecureStorage _secureStorage;

  @override
  Future<void> start() async {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future clear() async => _secureStorage.deleteAll();

  @override
  Future<bool?> getBool(String key) async {
    final value = await getInt(key);
    return value != null ? value > 0 : null;
  }

  @override
  Future<double?> getDouble(String key) async {
    final value = await _secureStorage.read(key: key);
    return value != null ? double.parse(value) : null;
  }

  @override
  Future<int?> getInt(String key) async {
    final value = await _secureStorage.read(key: key);
    return value != null ? int.parse(value) : null;
  }

  @override
  Future<String?> getString(String key) => _secureStorage.read(key: key);

  @override
  Future<bool> putBool(String key, bool value) {
    return putInt(key, value ? 1 : 0);
  }

  @override
  Future<bool> putDouble(String key, double value) async {
    await _secureStorage.write(key: key, value: '$value');
    return true;
  }

  @override
  Future<bool> putInt(String key, int value) async {
    await _secureStorage.write(key: key, value: '$value');
    return true;
  }

  @override
  Future<bool> putString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
    return true;
  }

  @override
  Future<bool> remove(String key) async {
    await _secureStorage.delete(key: key);
    return true;
  }
}
