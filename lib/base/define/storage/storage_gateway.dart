import '../../../di/di_module.dart';
import 'storage_client.dart';
import 'types/default_storage.dart';
import 'types/secure_storage.dart';

class StorageGateway {
  const StorageGateway(this.storage);

  final StorageClient storage;

  static StorageClient? _defaultStorage;
  static StorageClient? _secureStorage;

  static Future<void> init() async {
    _defaultStorage = DefaultStorage();
    _secureStorage = SecureStorage();

    await Future.wait([
      _defaultStorage!.start(),
      _secureStorage!.start(),
    ]);
  }

  factory StorageGateway.defaultGateway() => StorageGateway(_defaultStorage!);

  factory StorageGateway.secureGateway() => StorageGateway(_secureStorage!);

  Future<bool> putString(String key, String value) =>
      storage.putString(key, value);

  Future<String?> getString(String key) => storage.getString(key);

  Future<bool> putInt(String key, int value) => storage.putInt(key, value);

  Future<int?> getInt(String key) => storage.getInt(key);

  Future<bool> putDouble(String key, double value) =>
      storage.putDouble(key, value);

  Future<double?> getDouble(String key) => storage.getDouble(key);

  Future<bool> putBool(String key, bool value) => storage.putBool(key, value);

  Future<bool?> getBool(String key) => storage.getBool(key);

  Future<bool> remove(String key) => storage.remove(key);

  Future clear() => storage.clear();
}
