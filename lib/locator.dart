


import 'package:get_it/get_it.dart';

import 'core/repositories/dictionary_repository.dart';
import 'services/database_service.dart';
import 'services/navigation_service.dart';
import 'services/text_to_speech.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => DictionaryRepository());
  locator.registerLazySingleton(() => TtsService());
}