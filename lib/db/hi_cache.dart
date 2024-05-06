// 单例 + 预初始化
import 'package:shared_preferences/shared_preferences.dart';

class HiCache {
  SharedPreferences? preferences;

  HiCache._() {
    init();
  }

  static HiCache? _instance;

  static HiCache getInstance() {
    _instance ??= HiCache._();
    return _instance!;
  }

  void init() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  HiCache._pre(SharedPreferences prefs) {
    preferences = prefs;
  }

  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance!;
  }

  setBool(String key, bool value) {
    preferences?.setBool(key, value);
  }

  setInt(String key, int value) {
    preferences?.setInt(key, value);
  }

  setDouble(String key, double value) {
    preferences?.setDouble(key, value);
  }

  setString(String key, String value) {
    preferences?.setString(key, value);
  }

  setStringList(String key, List<String> value) {
    preferences?.setStringList(key, value);
  }

  T get<T>(String key, T defaultValue) {
    return preferences?.get(key) as T ?? defaultValue;
  }
}
