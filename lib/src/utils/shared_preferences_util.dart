import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static void delete(String key) async {
    instance.remove(key);
  }
}
