import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:local_data_impl/data/data_sources/hive_box_storage_service_impl.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_box_local_data_service.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_hive_box_storage_service.dart';
import 'package:local_data_impl/data/data_sources/local_data_service_hive_data_source_impl.dart';

void registerLocalHiveDataSourceServiceGetItDI() {
  sl.registerLazySingleton<IHiveBoxStorageService>(
    () => HiveBoxStorageServiceImpl(),
  );
  sl.registerLazySingleton<IBoxLocalDataService>(
    () => LocalDataServiceHiveDataSourceImpl(iHiveBoxStorageService: sl()),
  );
}
