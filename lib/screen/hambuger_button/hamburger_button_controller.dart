import 'package:anipet/const/baseurl.dart';
import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

class HamburgerButtonController extends GetxController {

  Dio dio = Dio();

  final String? userId;

  HamburgerButtonController({required this.userId});
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

  Future<Map<String?, dynamic>?> onMyInfoButtonClick() async {
    Common.logger.d(userId);
    try {
      Response response = await dio.post("$baseUrl/getuserinfo", data: {
        'userId': userId
      });
      final Map<String?, dynamic>? data = response.data;

      Common.logger.d(response.statusCode);
      Common.logger.d(response.data);
      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('Info Load success');
        return data;
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('Info Load fail');
        return {};
      }
    } catch (error) {
      // 에러 처리
      Common.logger.d(error);
      return {};
    }
  }
}
