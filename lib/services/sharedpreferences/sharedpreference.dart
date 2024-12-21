

import 'package:grocery_application/model/userdetails_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreference {
 

  // Save user to SharedPreferences
 static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJsonString());
  }

  // Fetch user from SharedPreferences
 static Future<UserModel?> fetchUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      return UserModel.fromJsonString(userJson);
    }
    return null;
  }

  // Clear user data from SharedPreferences
static  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}

  

