import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterAdoptionAnimalController extends GetxController {
  Dio dio = Dio();

  TextEditingController animalNameTextController = TextEditingController();

  TextEditingController breedTextController = TextEditingController();

  TextEditingController protectorAddressTextController =
      TextEditingController();

  TextEditingController protectorTelTextController = TextEditingController();

  //picture

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

  onRegisterAdoptionAnimalButtonClick() {
    print(animalNameTextController.text);
    print(breedTextController.text);
    print(protectorAddressTextController.text);
    print(protectorTelTextController);

    dio.post("http://서버주소", data: {
      "animalName": animalNameTextController.text,
      "breed": breedTextController.text,
      "protectorAddress": protectorAddressTextController.text,
      "protectorTel": protectorTelTextController.text,
    });
  }
}
