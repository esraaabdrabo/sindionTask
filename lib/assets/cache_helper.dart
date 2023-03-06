import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static Future<SharedPreferences> initSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  static Future<dynamic> getData({required String key}) async {
    var sharedPref = await initSharedPref();
    return sharedPref.get(key);
  }

  static setData({required String key, required data}) async {
    var sharedPref = await initSharedPref();

    if (data is String) {
      sharedPref.setString(key, data);
    } else {
      sharedPref.setBool(key, data);
    }
  }

  static removeData({required String key}) async {
    var sharedPref = await initSharedPref();
    sharedPref.remove(key);
  }
}
