import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenManager {
  static const String tokenKey = 'userToken';

  // 토큰 저장
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  // 토큰 불러오기
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  static bool isTokenExpired(String token) {
    try {
      // 토큰 디코딩
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // 만료 시간 확인
      if (decodedToken['exp'] * 1000 > DateTime.now().millisecondsSinceEpoch) {
        return false; // 토큰이 유효함
      } else {
        return true; // 토큰이 만료됨
      }
    } on Exception {
      return true; // 디코딩에 실패하면 토큰을 유효하지 않은 것으로 간주
    }
  }
}