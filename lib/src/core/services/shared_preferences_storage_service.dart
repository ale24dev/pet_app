import 'package:shared_preferences/shared_preferences.dart';

enum LocalStorageKey {
  isFirstOpen('is_first_open'),
  email('email'),
  rememberEmail('remember_email');

  const LocalStorageKey(this.key);

  final String key;
}

class AppPreferencesService {
  AppPreferencesService(this._preferences);

  final SharedPreferences _preferences;

  /// True if the user has opened the app before and completed the onboarding.
  bool isFirstOpen() => _preferences.getBool(LocalStorageKey.isFirstOpen.key) ?? true;

  /// Returns the stored email if the user chose to remember it.
  /// [Null] otherwise.
  String? email() => _preferences.getString(LocalStorageKey.email.key);

  /// True if the user has chosen for the app to remember its email.
  bool rememberEmail() => _preferences.getBool(LocalStorageKey.rememberEmail.key) ?? false;

  /// Saves a integer [value] to persistent storage.
  Future<bool> setInt(String key, int value) => _preferences.setInt(key, value);

  /// Saves a boolean [value] to persistent storage.
  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value) => _preferences.setBool(key, value);

  /// Saves a double [value] to persistent storage.
  Future<bool> setDouble(String key, double value) => _preferences.setDouble(key, value);

  /// Saves a String [value] to persistent storage.
  Future<bool> setString(String key, String value) => _preferences.setString(key, value);

  /// Saves a String List [value] to persistent storage.
  Future<bool> setStringList(String key, List<String> value) => _preferences.setStringList(key, value);
}
