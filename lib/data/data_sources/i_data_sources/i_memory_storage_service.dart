abstract class IMemoryStorageService {
  Set<String> getKeys();
  bool containsKey(String key);

  // read data
  int? getInt(String key);
  bool getBool(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String>? getStringList(String key);
  dynamic get(String key);

  // set data
  Future<bool> setBool(String key, bool value);
  Future<bool> setDouble(String key, double value);
  Future<bool> setInt(String key, int value);
  Future<bool> setString(String key, String value);
  Future<bool> setStringList(String key, List<String> value);

  // delete data
  Future<bool> clearMemory();
  Future<bool> remove(String key);

  Future<void> reload();
}
