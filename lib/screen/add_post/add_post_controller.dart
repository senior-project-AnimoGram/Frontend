import 'package:anipet/const/baseurl.dart';
import 'package:anipet/main.dart';
import 'package:anipet/manager/userId_manager.dart';
import 'package:anipet/screen/my_post/my_post_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();

  Rxn<XFile> image = Rxn();

  // picture

  Future<bool> addImageButtonOnClicked() async {
    image.value = await Common.getImageFromUser();
    return image.value != null;
  }

  Future<bool> onAddPostButtonClicked() async {
    Common.logger.d(titleTextEditingController.text);
    Common.logger.d(contentTextEditingController.text);

    if (image.value == null) {
      Get.snackbar("사진 추가", "사진을 추가해주세요", backgroundColor: Colors.white);
      return false;
    }
    Common.logger.d(image.value!.path);

    Dio dio = Dio();
    String? userId = await UserIdManager.getUserId();
    try {
      FormData data = FormData.fromMap({
        'title': titleTextEditingController.text,
        'content': contentTextEditingController.text,
        'userId': userId,
        'image': await MultipartFile.fromFile(
          image.value!.path,
          filename: userId! + '_' + image.value!.name,
        ),
      });


      Response response = await dio.post(
        "$baseUrl/addpost",
        data: data,
        options: Options(
          headers: {"Content-Type": "multipart/form-data"},
        ),
      );

      if (response.statusCode == 200) {
        // Successful data submission logic
        Common.logger.d('reservation success');
        return true;
      } else {
        // Logic for handling request failure
        Common.logger.d('reservation fail');
        Get.snackbar("API 오류", "네트워크 연결을 확인해주세요", backgroundColor: Colors.white);
        return false;
      }
    } catch (error) {
      Common.logger.d(error);
      Get.snackbar("API 오류", "네트워크 연결을 확인해주세요", backgroundColor: Colors.white);
      return false;
    }
  }
}
