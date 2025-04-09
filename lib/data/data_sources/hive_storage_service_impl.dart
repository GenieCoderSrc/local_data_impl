import 'package:hive/hive.dart';

import 'i_data_sources/i_hive_storage_service.dart';

class BoxStorageServiceHiveDataSourceImpl<T> extends IBoxStorageService {
  @override
  Box<T> getBox(String boxName) => Hive.box<T>('${boxName}_Config');

  @override
  Future<Box<T>> openBox(String boxName) async =>
      await Hive.openBox<T>('${boxName}_Config');
}
