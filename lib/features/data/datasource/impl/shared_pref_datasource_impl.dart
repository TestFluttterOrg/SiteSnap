import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitesnap/features/data/datasource/shared_pref_datasource.dart';

class SharedPrefDataSourceImpl extends SharedPrefDataSource {
  final SharedPreferences sharedPref;
  SharedPrefDataSourceImpl({required this.sharedPref});

  @override
  Future<void> clearData(String key) async {
    try {
      await sharedPref.remove(key);
    } catch (_) {}
  }

  @override
  Future<String?> getData(String key) async {
    try {
      final token = sharedPref.getString(key);
      return token;
    } catch (_) {}
    return null;
  }

  @override
  Future<void> setData(String key, String data) async {
    try {
      await sharedPref.setString(key, data);
    } catch (_) {}
  }
}