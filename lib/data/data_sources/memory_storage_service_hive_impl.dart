import 'package:local_data_impl/data/data_sources/i_data_sources/i_memory_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheStorageServiceHiveImpl extends IMemoryStorageService {
  //   late prefs = Application.preferences;

  // Obtain features preferences.
  final SharedPreferences prefs;

  CacheStorageServiceHiveImpl({required this.prefs});
  // = await SharedPreferences.getInstance();

  // ///Singleton repository
  //   final UtilPreferences _instance = UtilPreferences._internal();
  //
  // factory UtilPreferences() {
  //   return _instance;
  // }
  //
  // UtilPreferences._internal();

  @override
  Future<bool> clearMemory() {
    return prefs.clear();
  }

  @override
  bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  @override
  dynamic get(String key) {
    return prefs.get(key);
  }

  @override
  bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  @override
  double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return prefs.getInt(key);
  }

  @override
  Set<String> getKeys() {
    return prefs.getKeys();
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  @override
  Future<void> reload() {
    return prefs.reload();
  }

  @override
  Future<bool> remove(String key) {
    return prefs.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return prefs.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return prefs.setStringList(key, value);
  }
}
