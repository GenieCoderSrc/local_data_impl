import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_local_data_service.dart';

import 'package:local_data_impl/enum/data_type.dart';

import 'i_data_sources/i_hive_storage_service.dart';

class LocalDataServiceHiveDataSourceImpl extends ILocalDataService {
  final IBoxStorageService iHiveStorageService;

  LocalDataServiceHiveDataSourceImpl({required this.iHiveStorageService});

  @override
  Future<bool> addData({required String key, required data}) async {
    try {
      final Box box = await iHiveStorageService.openBox(key);
      await box.put(key, data);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | addData | error: $e');
      return false;
    }
  }

  @override
  Future getData({required String key, DataType? dataType}) async {
    try {
      final Box box = await iHiveStorageService.openBox(key);
      return await box.get(key);
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | getData | error: $e');
      return null;
    }
  }

  @override
  Future<bool> deleteData({required String key}) async {
    try {
      final Box box = await iHiveStorageService.openBox(key);
      await box.delete(key);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHiveDataSourceImpl | deleteData | error: $e');
      return false;
    }
  }
}
