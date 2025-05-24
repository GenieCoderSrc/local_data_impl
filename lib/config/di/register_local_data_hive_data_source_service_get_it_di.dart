

import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:local_data_impl/data/data_sources/hive_storage_service_impl.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_hive_storage_service.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_local_data_service.dart';
import 'package:local_data_impl/data/data_sources/local_data_service_hive_data_source_impl.dart';

void registerLocalHiveDataSourceServiceGetItDI() {
  sl.registerLazySingleton<IBoxStorageService>(
      () => BoxStorageServiceHiveDataSourceImpl());
  sl.registerLazySingleton<ILocalDataService>(
      () => LocalDataServiceHiveDataSourceImpl(iHiveStorageService: sl()));
}
