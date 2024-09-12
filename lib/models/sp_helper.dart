import 'package:profile_demo/models/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static late SharedPreferences prefes;

  Future init() async {
    // SharedPreferences.setMockInitialValues({});

    prefes = await SharedPreferences.getInstance();
  }

  Future setUser(UserInfo user) async {
    await prefes
        .setStringList(user.username, <String>[user.username, user.email]);
  }

  getUser(String id) {
    return prefes.getStringList(id);
  }

  Future setUserPrefes(bool isDarkMode) async {
    await prefes.setBool('isDarkMode', isDarkMode);
  }

  getUserPrefes(String isDarkMode) {
    return prefes.getBool(isDarkMode);
  }
}
