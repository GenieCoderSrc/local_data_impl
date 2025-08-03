import 'package:local_data_impl/enum/data_type.dart';
import 'package:local_data_impl/local_data_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Initialize SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Create memory storage service
  final IMemoryStorageService memoryStorageService =
      CacheStorageServiceSharedPrefsImpl(prefs: sharedPreferences);

  // Create local data service
  final ILocalDataService localDataService =
      LocalDataServiceCacheStorageDataSourceImpl(
        iMemoryStorageService: memoryStorageService,
      );

  // Add Data
  await localDataService.addData(key: 'username', data: 'JohnDoe');
  await localDataService.addData(key: 'user_age', data: 30);

  // Retrieve Data
  final String? username = await localDataService.getData(
    key: 'username',
    dataType: DataType.string,
  );
  final int? userAge = await localDataService.getData(
    key: 'user_age',
    dataType: DataType.int,
  );

  print('Username: $username'); // Output: Username: JohnDoe
  print('User Age: $userAge'); // Output: User Age: 30

  // Delete Data
  await localDataService.deleteData(key: 'username');

  // Confirm Deletion
  final deletedUsername = await localDataService.getData(
    key: 'username',
    dataType: DataType.string,
  );
  print('Deleted Username: $deletedUsername'); // Output: Deleted Username: null
}
