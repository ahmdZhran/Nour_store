import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  // Use consistent secure storage options across all operations.
  static const AndroidOptions _androidOptions = AndroidOptions(
    // Store using EncryptedSharedPreferences to avoid keystore key invalidation issues.
    // encrypted: true,
    // If a decryption error occurs (e.g., key invalidated), clear the stored entry.
    resetOnError: true,
  );

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Clears all data except the specified keys to preserve
  static Future<void> clearAllDataExcept(List<String> keysToPreserve) async {
    debugPrint('SharedPrefHelper : clearing all data except: $keysToPreserve');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    // Save the values to preserve with their types
    final Map<String, Map<String, dynamic>> preservedValues = {};
    for (final key in keysToPreserve) {
      final value = sharedPreferences.get(key);
      if (value != null) {
        String type;
        if (value is String) {
          type = 'String';
        } else if (value is int) {
          type = 'int';
        } else if (value is bool) {
          type = 'bool';
        } else if (value is double) {
          type = 'double';
        } else {
          continue; // Skip unsupported types
        }
        preservedValues[key] = {'type': type, 'value': value};
      }
    }
    
    // Clear all data
    await sharedPreferences.clear();
    
    // Restore preserved values
    for (final entry in preservedValues.entries) {
      final key = entry.key;
      final type = entry.value['type'] as String;
      final value = entry.value['value'];
      
      switch (type) {
        case 'String':
          await sharedPreferences.setString(key, value as String);
          break;
        case 'int':
          await sharedPreferences.setInt(key, value as int);
          break;
        case 'bool':
          await sharedPreferences.setBool(key, value as bool);
          break;
        case 'double':
          await sharedPreferences.setDouble(key, value as double);
          break;
      }
    }
    
    debugPrint('SharedPrefHelper : preserved ${preservedValues.length} value(s)');
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  // Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    try {
      return await flutterSecureStorage.read(key: key) ?? '';
    } on PlatformException catch (e) {
      // Handle BAD_DECRYPT or other crypto errors by clearing the bad entry
      debugPrint(
        'FlutterSecureStorage read error for "$key": ${e.message} -> clearing key',
      );
      try {
        await flutterSecureStorage.delete(key: key);
      } catch (_) {}
      return '';
    }
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    await flutterSecureStorage.deleteAll();
  }

  static Future<void> saveUserId(int userId) async {
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    debugPrint("FlutterSecureStorage : saveUserId -> $userId");
    await flutterSecureStorage.write(key: 'user_id', value: userId.toString());
  }

  /// Gets the current user's ID securely.
  static Future<int?> getUserId() async {
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    String? value;
    try {
      value = await flutterSecureStorage.read(key: 'user_id');
    } on PlatformException catch (e) {
      debugPrint(
        'FlutterSecureStorage read error for "user_id": ${e.message} -> clearing key',
      );
      try {
        await flutterSecureStorage.delete(key: 'user_id');
      } catch (_) {}
      value = null;
    }
    debugPrint("FlutterSecureStorage : getUserId -> $value");
    return value != null ? int.tryParse(value) : null;
  }

  /// Removes the stored userId securely.
  static Future<void> removeUserId() async {
    const flutterSecureStorage = FlutterSecureStorage(
      aOptions: _androidOptions,
    );
    debugPrint("FlutterSecureStorage : removeUserId");
    await flutterSecureStorage.delete(key: 'user_id');
  }
}