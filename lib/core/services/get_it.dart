import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    // Register Firebase Analytics

    // Register SharedPreferences as lazy singleton
    _getIt.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );

    // Wait for SharedPreferences to be ready if needed
    await _getIt.isReady<SharedPreferences>();
  }

  // Specific getters for common services

  static SharedPreferences get prefs =>
      _getIt.get<SharedPreferences>();
}
