import 'package:hive/hive.dart';

import 'i_data_sources/i_hive_box_storage_service.dart';

class HiveBoxStorageServiceImpl implements IHiveBoxStorageService {
  @override
  Box getBox(String boxName) => Hive.box('${boxName}_Config');

  @override
  Future<Box> openBox(String boxName) async =>
      await Hive.openBox('${boxName}_Config');
}
