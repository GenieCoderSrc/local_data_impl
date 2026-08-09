import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:local_data_impl/enum/data_type.dart';

import 'i_data_sources/i_box_local_data_service.dart';
import 'i_data_sources/i_hive_box_storage_service.dart';

class LocalDataServiceHiveDataSourceImpl extends IBoxLocalDataService {
  final IHiveBoxStorageService iHiveBoxStorageService;

  LocalDataServiceHiveDataSourceImpl({required this.iHiveBoxStorageService});

  @override
  Future<bool> addData({
    required String key,
    required dynamic data,
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      await box.put(key, data);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | addData | error: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteData({
    required String key,
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      await box.delete(key);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | deleteData | error: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteAllData({
    required List<String> keys,
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      await box.deleteAll(keys);
      return true;
    } catch (e) {
      debugPrint(
        'LocalDataServiceHiveDataSourceImpl | deleteAllData | error: $e',
      );
      return false;
    }
  }

  @override
  Future getData({
    required String key,
    DataType? dataType = DataType.map,
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      return box.get(key);
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | getData | error: $e');
      return null;
    }
  }

  @override
  Future<List<dynamic>> getDataByPrefix({
    required String prefix,
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);

      // Filter keys matching the hierarchical path prefix (e.g., "users/123/notes")
      return box.keys
          .where((key) => key.toString().startsWith(prefix))
          .map((key) => box.get(key))
          .toList();
    } catch (e) {
      debugPrint(
        'LocalDataServiceHiveDataSourceImpl | getDataByPrefix | error: $e',
      );
      return [];
    }
  }

  @override
  Future<List<String>> getAllKeys({String boxName = 'default'}) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      // Convert all keys to String list safely
      return box.keys.map((key) => key.toString()).toList();
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | getAllKeys | error: $e');
      return [];
    }
  }

  @override
  Future<Map<String, dynamic>> getAllValues({
    String boxName = 'default',
  }) async {
    try {
      final Box box = await iHiveBoxStorageService.openBox(boxName);
      // box.toMap() returns Map<dynamic, dynamic>, cast it safely to Map<String, dynamic>
      final Map rawMap = box.toMap();
      return rawMap.map((key, value) => MapEntry(key.toString(), value));
    } catch (e) {
      debugPrint(
        'LocalDataServiceHiveDataSourceImpl | getAllValues | error: $e',
      );
      return {};
    }
  }
}

// class LocalDataServiceHiveDataSourceImpl extends ILocalDataService {
//   final IHiveBoxStorageService iHiveStorageService;
//
//   LocalDataServiceHiveDataSourceImpl({required this.iHiveStorageService});
//
//   @override
//   Future<bool> addData({required String key, required data}) async {
//     try {
//       final Box box = await iHiveStorageService.openBox(key);
//       await box.put(key, data);
//       return true;
//     } catch (e) {
//       debugPrint('LocalDataServiceHiveDataSourceImpl | addData | error: $e');
//       return false;
//     }
//   }
//
//   @override
//   Future getData({required String key, DataType? dataType}) async {
//     try {
//       final Box box = await iHiveStorageService.openBox(key);
//       return await box.get(key);
//     } catch (e) {
//       debugPrint('LocalDataServiceHiveDataSourceImpl | getData | error: $e');
//       return null;
//     }
//   }
//
//   @override
//   Future<bool> deleteData({required String key}) async {
//     try {
//       final Box box = await iHiveStorageService.openBox(key);
//       await box.delete(key);
//       return true;
//     } catch (e) {
//       debugPrint('LocalDataServiceHiveDataSourceImpl | deleteData | error: $e');
//       return false;
//     }
//   }
// }
