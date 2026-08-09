import '../../../enum/data_type.dart';

/// Basic key-value operations for simple storage (SharedPreferences, Hydrated, Cache)
abstract class ILocalDataService {
  Future<bool> addData({required String key, required dynamic data});
  Future<bool> deleteData({required String key});
  Future<dynamic> getData({
    required String key,
    DataType? dataType = DataType.map,
  });
}

// abstract class ILocalDataService {
//   Future<bool> addData({
//     required String key,
//     required dynamic data,
//     String boxName = 'default',
//   });
//   // Future<bool> updateData({
//   //   required String key,
//   //   required dynamic data,
//   //   String boxName = 'default',
//   // });
//   Future<bool> deleteData({required String key, String boxName = 'default'});
//   Future<bool> deleteAllData({
//     required List<String> keys,
//     String boxName = 'default',
//   }); // Bulk delete
//
//   Future<dynamic> getData({
//     required String key,
//     DataType? dataType = DataType.map,
//     String boxName = 'default',
//   });
//   Future<List<dynamic>> getDataByPrefix({
//     required String prefix,
//     String boxName = 'default',
//   });
//
//   Future<List<String>> getAllKeys({String boxName = 'default'});
//   Future<Map<String, dynamic>> getAllValues({String boxName = 'default'});
// }
