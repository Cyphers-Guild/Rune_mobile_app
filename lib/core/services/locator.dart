// lib/core/services/locator.dart
import 'package:get_it/get_it.dart';
import 'package:rune/data/repositories.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<UserRepository>(UserRepository());
  // locator.registerSingleton<AuthService>(AuthServiceImpl());
  // locator.registerSingleton<ApiService>(ApiService());
}
