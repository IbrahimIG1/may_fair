import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  void setString(String key, dynamic value);
  String? getString(String key);
  void removeData(String key);
  void clearData();
  void setSecureString(String key, dynamic value);
  Future<String?> getSecureString(String key);
}

class SharedPrefImpl implements SharedPref {
  SharedPrefImpl._private();
  static SharedPrefImpl? _instance;
  factory SharedPrefImpl() {
    if (_instance == null) {
      _instance = SharedPrefImpl._private();

      return _instance!;
    } else {
      return _instance!;
    }
  }

  static SharedPreferences? _sharedprefrence;

  static Future<SharedPreferences> initSharedPreference() async {
    if (_sharedprefrence == null) {
      return _sharedprefrence = await SharedPreferences.getInstance();
    } else {
      return _sharedprefrence!;
    }
  }

  /// Delete All Data From SharedPreference
  @override
  void clearData() {
    _sharedprefrence!.clear();
  }

  /// Delete Specific value From SharedPreference with [key]
  @override
  void removeData(String key) {
    _sharedprefrence!.remove(key);
  }

  /// Save String value in SharedPreference with [key] , [value]
  @override
  void setString(String key, dynamic value) {
    print('>>>>>>>>>>>>>>>>>>>set String done');
    _sharedprefrence!.setString(key, value);
  }

  /// Get String value From SharedPreference with [key]
  @override
  String? getString(String key) {
    return _sharedprefrence!.getString(key) ?? '';
  }

  /// Save String value in SharedPreference with [key] , [value]
  @override
  void setSecureString(String key, value) async {
    const FlutterSecureStorage flutterSecure = FlutterSecureStorage();
    await flutterSecure.write(key: key, value: value);
  }

  /// Get String value From FlutterSecureStorage with [key]
  @override
  Future<String?> getSecureString(String key) {
    const FlutterSecureStorage flutterSecure = FlutterSecureStorage();
    return flutterSecure.read(key: key);
  }
}
