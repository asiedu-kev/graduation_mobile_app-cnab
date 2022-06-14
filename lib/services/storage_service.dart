import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';

class StorageService {
  SharedPreferences? _prefs;
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;

  StorageService._internal();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  setHasBeenOnBoarded(bool? value) {
    _prefs?.setBool(HAS_BEEN_ON_BOARDED, value!);
  }

  bool? getHasBeenOnBoarded() {
    return _prefs?.getBool(HAS_BEEN_ON_BOARDED) ?? false;
  }

  setUserCredentials(String value) {
    _prefs?.setString(USER_CREDENTIALS, value);
  }

  String? getUserCredentials() {
    return _prefs?.getString(USER_CREDENTIALS) ?? "";
  }
}
