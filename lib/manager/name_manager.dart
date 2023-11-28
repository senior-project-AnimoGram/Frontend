import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class NameManager {
  static const String key = 'name';

  // userId 저장
  static Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, name);
  }

  // userId 불러오기
  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // userId 삭제하기
  static Future<void> clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

}