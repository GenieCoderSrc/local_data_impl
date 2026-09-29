# Local Data Impl

**Local Data** is a Dart package that provides a structured way to manage local data storage using **Hive, SharedPreferences, and HydratedBloc**.

## Features
- **Hive Storage** for structured key-value storage.
- **SharedPreferences** for simple key-value storage.
- **HydratedBloc** for state persistence.
- **Memory Storage Interface** for abstraction and flexibility.

## Installation

Add this to your `pubspec.yaml`:

```yaml
resolution: workspace

dependencies:
  local_data_impl: latest_version
```

Then, run:

```sh
dart pub get
```

## Usage

### Register Local Data Services

```dart
import 'package:local_data_impl/local_data_impl.dart';
import 'package:global/get_it_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void localDataServiceGetItRegister() async {
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<IMemoryStorageService>(
          () => CacheStorageServiceSharedPrefsImpl(prefs: sl()));

  sl.registerLazySingleton<ILocalDataService>(
          () => LocalDataServiceHydratedImpl());
}
```

### Save Data
```dart
final ILocalDataService localDataService = LocalDataServiceHydratedImpl();
await localDataService.addData(key: 'user', data: {'name': 'Alice', 'age': 25});
```

### Retrieve Data
```dart
final userData = await localDataService.getData(key: 'user');
print(userData); // Output: {name: Alice, age: 25}
```

### Delete Data
```dart
await localDataService.deleteData(key: 'user');
```

## Supported Data Types
- `String`
- `int`
- `bool`
- `double`
- `List<String>`
- `Map<String, dynamic>`

## License
MIT License
