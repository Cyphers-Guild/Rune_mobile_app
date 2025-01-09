// lib/core/services/locator.dart
import 'package:get_it/get_it.dart';
import 'package:rune/core/base/base_view_model.dart';
import 'package:rune/data/repositories.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<BaseViewModel>(() => BaseViewModel());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());

  // locator.registerSingleton<AuthService>(AuthServiceImpl());
  // locator.registerSingleton<ApiService>(ApiService());
}
