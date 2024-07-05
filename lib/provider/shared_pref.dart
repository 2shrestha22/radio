import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  const SharedPref._();

  static late final SharedPreferences _sharedPref;

  static const _favKey = 'fav';

  static List<String> get fav => _sharedPref.getStringList(_favKey) ?? [];

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> addToFavorite(String id) async {
    _sharedPref.setStringList(_favKey, fav..add(id));
  }

  static Future<void> removeFromFavorite(String id) async {
    _sharedPref.setStringList(_favKey, fav..remove(id));
  }
}
