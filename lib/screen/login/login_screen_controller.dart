import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

class LoginScreenController extends GetxController {
  Dio dio = Dio();

  TextEditingController idTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<void> onLoginButtonClick() async {
    Common.logger.d(idTextController.text);
    Common.logger.d(passwordTextController.text);

    try {
      Response response = await dio.post("http://localhost:3000/login", data: {
        'id': idTextController.text,
        'password': passwordTextController.text,
      });
      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('login success');
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('login fail');
      }
    } catch (error) {
      // 에러 처리
      Common.logger.d('login error');
    }
  }
}
