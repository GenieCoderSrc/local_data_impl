import 'package:hive/hive.dart';

abstract class IBoxStorageService<T> {
  Box<T> getBox(String boxName);
  Future<Box<T>> openBox(String boxName);
}
