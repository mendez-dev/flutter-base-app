import 'package:base_app/src/models/theme/theme_model.dart';

abstract class PreferencesRepository {
  void save<Type>(String key, Type value);

  void remove(String key);

  Future<String> getToken();

  Future<String> getBaseUrl();

  Future<double> getDouble(String key);

  Future<bool> getBool(String key);

  Future<void> setTheme(ThemeModel theme);

  Future<ThemeModel> getTheme();
}
