import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

import '../../const/baseurl.dart';

class SignupScreenController extends GetxController {
  Dio dio = Dio();

  TextEditingController nameTextController = TextEditingController();

  TextEditingController phoneTextController = TextEditingController();

  TextEditingController idTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> onSignupButtonClick() async {
    Common.logger.d(nameTextController.text);
    Common.logger.d(phoneTextController.text);
    Common.logger.d(idTextController.text);
    Common.logger.d(passwordTextController.text);
    try {
      Response response = await dio.post("$baseUrl/signup", data: {
        'name': nameTextController.text,
        'phone': phoneTextController.text,
        'userId': idTextController.text,
        'password': passwordTextController.text,
      });

      Common.logger.d(response.statusCode);
      Common.logger.d(response.data);
      if (response.statusCode == 201) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('signup success');
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('signup fail');
      }
    } catch (error) {
      // 에러 처리
      // HTTP 요청이 실패했을 때의 에러를 처리하는 코드를 작성합니다.
    }
  }
}
