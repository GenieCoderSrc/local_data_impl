import 'package:local_data_impl/enum/data_type.dart';

import 'i_local_data_service.dart';

/// Advanced operations for NoSQL/Box storage (Hive, Isar)
abstract class IBoxLocalDataService implements ILocalDataService {
  // Overriding basic methods to include boxName parameter
  @override
  Future<bool> addData({
    required String key,
    required dynamic data,
    String boxName = 'default',
  });

  @override
  Future<bool> deleteData({required String key, String boxName = 'default'});

  @override
  Future<dynamic> getData({
    required String key,
    DataType? dataType = DataType.map,
    String boxName = 'default',
  });

  // Advanced Box operations
  Future<bool> deleteAllData({
    required List<String> keys,
    String boxName = 'default',
  });

  Future<List<dynamic>> getDataByPrefix({
    required String prefix,
    String boxName = 'default',
  });

  Future<List<String>> getAllKeys({String boxName = 'default'});

  Future<Map<String, dynamic>> getAllValues({String boxName = 'default'});
}
