import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  Dio dio = Dio();

  TextEditingController emailTextController = TextEditingController();

  TextEditingController idTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  TextEditingController petNameTextController = TextEditingController();

  TextEditingController breedTextController = TextEditingController();

  TextEditingController ageTextController = TextEditingController();

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

  void onSignupButtonClick() {
    print(emailTextController.text);
    print(idTextController.text);
    print(passwordTextController.text);
    print(petNameTextController);
    print(breedTextController);
    print(ageTextController);
    dio.post("http://서버주소", data: {
      'email': emailTextController.text,
      'id': idTextController.text,
      'password': passwordTextController.text,
      'petName': petNameTextController.text,
      'breed': breedTextController.text,
      'age': ageTextController.text,
    });
  }
}
