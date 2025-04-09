
import '../../../enum/data_type.dart';

abstract class ILocalDataService {
  Future<bool> addData({required String key, required data});
  Future<bool> deleteData({required String key});
  Future getData({required String key, DataType? dataType = DataType.map});
}
