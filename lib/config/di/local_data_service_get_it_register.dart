import 'package:get_it_di_global_variable/get_it_di.dart';

import 'package:local_data_impl/data/data_sources/i_data_sources/i_local_data_service.dart';
import 'package:local_data_impl/data/data_sources/i_data_sources/i_memory_storage_service.dart';
import 'package:local_data_impl/data/data_sources/local_data_service_hydrated_impl.dart';
import 'package:local_data_impl/data/data_sources/memory_storage_service_shared_prefs_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void localDataServiceGetItRegister() async {
  /// ----------------- Local Data--------------
  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  /// Service
  sl.registerLazySingleton<IMemoryStorageService>(
      () => CacheStorageServiceSharedPrefsImpl(prefs: sl()));

  sl.registerLazySingleton<ILocalDataService>(
      () => LocalDataServiceHydratedImpl());
}
