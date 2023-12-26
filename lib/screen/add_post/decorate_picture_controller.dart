import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

import '../../const/baseurl.dart';
import '../../main.dart';
import '../../manager/userId_manager.dart';


class DecorateController extends GetxController {

  Future<String?> putSticker(XFile? photo, int selectedFilterIndex) async{
    String? userId = await UserIdManager.getUserId();
    Dio dio = Dio();
    try {
      FormData data = FormData.fromMap({
        'selectedFilterIndex': selectedFilterIndex,
        'userId': userId,
        'image': await MultipartFile.fromFile(
          photo!.path,
          filename: userId! + '_' + photo!.name,
        ),
      });
      Response response = await dio.post(
        "$baseUrl/putsticker",
        data: data
      );
      // 기다리는 동안 잠시만 기다려주세요 창 띄우기

      if (response.statusCode == 200) {
        // Successful data submission logic
        Common.logger.d('reservation success');
        return response.toString();
      } else {
        // Logic for handling request failure
        Common.logger.d('reservation fail');
        Get.snackbar("API 오류", "네트워크 연결을 확인해주세요", backgroundColor: Colors.white);
        return null;
      }
    } catch (error) {
      Common.logger.d(error);
      Get.snackbar("API 오류", "네트워크 연결을 확인해주세요", backgroundColor: Colors.white);
      return null;
    }
  }
}


