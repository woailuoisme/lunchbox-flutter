import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/logger_utils.dart';

part 'storage_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return StorageService(prefs);
}

class StorageService {
  StorageService(this._prefs);
  final SharedPreferences _prefs;

  T? read<T>(String key) {
    try {
      if (T == String) {
        return _prefs.getString(key) as T?;
      }
      if (T == int) {
        return _prefs.getInt(key) as T?;
      }
      if (T == double) {
        return _prefs.getDouble(key) as T?;
      }
      if (T == bool) {
        return _prefs.getBool(key) as T?;
      }
      if (T == List<String>) {
        return _prefs.getStringList(key) as T?;
      }
      return _prefs.get(key) as T?;
    } catch (e) {
      LoggerUtils.w('Failed to read key: $key', e);
      return null;
    }
  }

  Future<void> write(String key, Object? value) async {
    try {
      if (value is String) {
        await _prefs.setString(key, value);
      } else if (value is int) {
        await _prefs.setInt(key, value);
      } else if (value is double) {
        await _prefs.setDouble(key, value);
      } else if (value is bool) {
        await _prefs.setBool(key, value);
      } else if (value is List<String>) {
        await _prefs.setStringList(key, value);
      } else {
        LoggerUtils.e('Unsupported type for key: $key');
      }
      LoggerUtils.d('Wrote to storage: $key');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to write key: $key', e, stackTrace);
      rethrow;
    }
  }

  Future<void> remove(String key) async {
    try {
      await _prefs.remove(key);
      LoggerUtils.d('Removed from storage: $key');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to remove key: $key', e, stackTrace);
      rethrow;
    }
  }

  Future<void> clear() async {
    try {
      await _prefs.clear();
      LoggerUtils.i('Storage cleared');
    } catch (e, stackTrace) {
      LoggerUtils.e('Failed to clear storage', e, stackTrace);
      rethrow;
    }
  }

  bool hasKey(String key) {
    return _prefs.containsKey(key);
  }

  Set<String> getKeys() {
    return _prefs.getKeys();
  }

  int getSize() {
    return _prefs.getKeys().length;
  }
}
