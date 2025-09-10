import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  // تهيئة SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // حفظ البيانات
  static Future<bool> saveData(
      {required String key, required String value}) async {
    return await _preferences!.setString(key, value);
  }

  // جلب البيانات
  static String? getData({required String key}) {
    return _preferences!.getString(key);
  }

  // حذف البيانات
  static Future<bool> removeData({required String key}) async {
    return await _preferences!.remove(key);
  }
}
