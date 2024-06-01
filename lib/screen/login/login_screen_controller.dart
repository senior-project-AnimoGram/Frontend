import 'dart:convert';

import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

import '../../const/baseurl.dart';

class LoginScreenController extends GetxController {
  Dio dio = Dio();

  TextEditingController idTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<Map<String, dynamic>?> onLoginButtonClick() async {
    Common.logger.d(idTextController.text);
    Common.logger.d(passwordTextController.text);

    try {
      Response response = await dio.post("$baseUrl/login", data: {
        'userId': idTextController.text,
        'password': passwordTextController.text,
      });
      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('login success');
        Common.logger.d(response.data);
        final Map<String, dynamic> data = response.data;
        final String userId = data['userId'];
        final String name = data['nickname'];
        final String token = data['token'];

        List<String> loginData = [userId, name, token];
        return data;
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('login fail');
        return {};
      }
    } catch (error) {
      // 에러 처리
      Common.logger.d(error);
      return {};
    }
  }
}
