import 'package:shared_preferences/shared_preferences.dart';

class Helper_functions {
  static String user_logged_in_key = "LOGGEDINKEY";
  static String user_name_key = "USERNAMEKEY";
  static String user_email_key = "USEREMAILKEY";

  static Future<bool> save_user_log_in_status(bool is_logged_in) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(user_logged_in_key, is_logged_in);
  }

  static Future<bool> save_username(String user_name) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(user_name_key, user_name);
  }

  static Future<bool> save_useremail(String user_email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(user_email_key, user_email);
  }

  static Future<bool?> get_user_logged_in_status() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(user_logged_in_key);
  }

  static get_user_name_from_SF() {}

  static get_user_email_from_SF() {}
}
