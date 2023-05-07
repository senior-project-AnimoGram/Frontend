import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  Dio dio = Dio();

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

  void onLoginButtonClick() {
    print(idTextController.text);
    print(passwordTextController.text);

    dio.post("http://서버주소", data: {
      'id': idTextController.text,
      'password': passwordTextController.text,
    });
  }
}
