import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:local_data_impl_impl/data/data_sources/i_data_sources/i_local_data_service.dart';
import 'package:local_data_impl_impl/enum/data_type.dart' ;


import 'i_data_sources/i_memory_storage_service.dart';

class LocalDataServiceCacheStorageDataSourceImpl extends ILocalDataService {
  final IMemoryStorageService iMemoryStorageService;

  LocalDataServiceCacheStorageDataSourceImpl(
      {required this.iMemoryStorageService});

  @override
  Future<bool> deleteData({required String key}) async {
    try {
      return await iMemoryStorageService.remove(key);
    } catch (e) {
      debugPrint(
          'LocalDataServiceCacheStorageDataSourceImpl | setData | error: $e');
      return false;
    }
  }

  @override
  Future<bool> addData({required String key, required data}) async {
    try {
      // int type data
      if (data.runtimeType is int) {
        return await iMemoryStorageService.setInt(key, data);

        // bool type data
      } else if (data.runtimeType is bool) {
        return await iMemoryStorageService.setBool(key, data);

        // double type data
      } else if (data.runtimeType is double) {
        return await iMemoryStorageService.setDouble(key, data);

        // String type data
      } else if (data.runtimeType is String) {
        return await iMemoryStorageService.setString(key, data);

        // List<String> type data
      } else if (data.runtimeType is List<String>) {
        return await iMemoryStorageService.setStringList(key, data);

        // Map type data
      } else if (data.runtimeType is Map<String, dynamic>) {
        String enCodedData = jsonEncode(data).toString();
        // todo! remove debugPrint();
        debugPrint(
            'LocalDataServiceCacheStorageDataSourceImpl | setData | enCodedData: $enCodedData');
        return await iMemoryStorageService.setString(key, enCodedData);

        // others type data
      } else {
        return iMemoryStorageService.setString(key, data.toString());
      }
    } catch (e) {
      debugPrint(
          'LocalDataServiceCacheStorageDataSourceImpl | setData | error: $e');
      return false;
    }
  }

  @override
  Future getData(
      {required String key, DataType? dataType = DataType.map}) async {
    try {
      if (dataType == DataType.int) {
        // int type data
        return iMemoryStorageService.getInt(key);
      } else if (dataType == DataType.bool) {
        // bool type data
        return iMemoryStorageService.getBool(key);
      } else if (dataType == DataType.double) {
        // double type data
        return iMemoryStorageService.getDouble(key);
      } else if (dataType == DataType.string) {
        // String type data
        return iMemoryStorageService.getString(key);
      } else if (dataType == DataType.stringList) {
        // List<String> type data
        return iMemoryStorageService.getStringList(key);
      } else if (dataType == DataType.map) {
        // Map type data
        return await jsonDecode(iMemoryStorageService.get(key));
      } else {
        // others type data
        return await iMemoryStorageService.get(key);
      }
    } catch (e) {
      debugPrint(
          'LocalDataServiceCacheStorageDataSourceImpl | getData | error: $e');
      return null;
    }
  }
}
