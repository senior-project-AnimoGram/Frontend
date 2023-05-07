import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddHospitalController extends GetxController {
  Dio dio = Dio();

  TextEditingController nameTextController = TextEditingController();

  TextEditingController addressTextController = TextEditingController();

  TextEditingController telTextController = TextEditingController();

  TextEditingController websiteTextController = TextEditingController();

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

  void onHospitalRegisterButtonClick() {
    print(nameTextController.text);
    print(addressTextController.text);
    print(telTextController.text);
    print(websiteTextController.text);

    dio.post("http://서버주소", data: {
      "name": nameTextController.text,
      "address": addressTextController.text,
      "tel": telTextController.text,
      "website": websiteTextController.text,
    });
  }
}
