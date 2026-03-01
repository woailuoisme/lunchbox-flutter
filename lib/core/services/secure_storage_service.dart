import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(Ref ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      // 默认推荐使用 RSA OAEP + AES-GCM (API 23+)
      // 相比于 encryptedSharedPreferences: true，官方更推荐这个默认选项以获得更好的兼容性
    ),
    iOptions: IOSOptions(
      // 默认设置为已解锁时可访问，增强安全性
      accessibility: KeychainAccessibility.unlocked,
    ),
  );
}

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  final storage = ref.watch(flutterSecureStorageProvider);
  return SecureStorageService(storage);
}

/// 安全存储服务
///
/// 使用 flutter_secure_storage 存储敏感信息（如 Token）
class SecureStorageService {
  SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;

  /// 读取字符串值
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      LoggerUtils.e('Failed to read secure key: $key', e);
      return null;
    }
  }

  /// 写入字符串值
  Future<void> write(String key, String? value) async {
    try {
      await _storage.write(key: key, value: value);
      LoggerUtils.d('Wrote to secure storage: $key');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to write secure key: $key', e, stackTrace);
      rethrow;
    }
  }

  /// 删除指定键
  Future<void> remove(String key) async {
    try {
      await _storage.delete(key: key);
      LoggerUtils.d('Removed from secure storage: $key');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to remove secure key: $key', e, stackTrace);
      rethrow;
    }
  }

  /// 清空所有安全存储
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
      LoggerUtils.i('Secure storage cleared');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to clear secure storage', e, stackTrace);
      rethrow;
    }
  }

  /// 检查是否存在指定键
  Future<bool> hasKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      LoggerUtils.e('Failed to check secure key: $key', e);
      return false;
    }
  }

  /// 获取所有键值对
  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      LoggerUtils.e('Failed to read all secure keys', e);
      return {};
    }
  }
}
