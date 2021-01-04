

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  _getInstance() async {
    return await SharedPreferences.getInstance();
  }

}

class SHARED_PREF_KEYS{
  static const LOGIN_DATA = "LOGIN_DATA";
}