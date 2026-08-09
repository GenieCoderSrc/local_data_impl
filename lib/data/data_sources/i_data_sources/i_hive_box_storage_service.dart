import 'package:hive/hive.dart';

abstract class IHiveBoxStorageService {
  Future<Box> openBox(String boxName);

  Box getBox(String boxName);
}
