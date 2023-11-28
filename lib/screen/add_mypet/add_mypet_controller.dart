import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

import '../../const/baseurl.dart';

class AddMypetController extends GetxController {
  Dio dio = Dio();

  TextEditingController petNameTextController = TextEditingController();

  TextEditingController breedTextController = TextEditingController();

  TextEditingController ageTextController = TextEditingController();

  final String userId;
  AddMypetController({required this.userId});
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

  Future<void> onAddMypetButtonClicked() async {
    Common.logger.d(userId);
    Common.logger.d(petNameTextController.text);
    Common.logger.d(breedTextController.text);
    Common.logger.d(ageTextController.text);

    try {
      Response response = await dio.post("$baseUrl/addpet", data: {
        'userId': userId,
        'petName': petNameTextController.text,
        'breed': breedTextController.text,
        'age': ageTextController.text,
      });
      Common.logger.d(response.data);
      if (response.statusCode == 200) {
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
