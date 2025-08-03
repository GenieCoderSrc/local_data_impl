import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_local_data_service.dart';
import 'package:local_data_impl/enum/data_type.dart';

class LocalDataServiceHydratedImpl extends ILocalDataService {
  final hydratedStorage = HydratedBloc.storage;

  @override
  Future<bool> addData({required String key, required data}) async {
    try {
      await hydratedStorage.write(key, data);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHydratedImpl | addData | error: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteData({required String key}) async {
    try {
      await hydratedStorage.delete(key);
      return true;
    } catch (e) {
      debugPrint('LocalDataServiceHydratedImpl | deleteData | error: $e');
      return false;
    }
  }

  @override
  Future getData({
    required String key,
    DataType? dataType = DataType.map,
  }) async {
    try {
      return await hydratedStorage.read(key);
    } catch (e) {
      debugPrint('LocalDataServiceHydratedImpl | getData| error: $e');
    }
  }
}
