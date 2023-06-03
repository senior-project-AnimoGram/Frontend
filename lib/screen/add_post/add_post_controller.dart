import 'package:anipet/main.dart';
import 'package:anipet/screen/my_post/my_post_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();

  Rxn<XFile> image = Rxn();

  //picture

  Future<bool> addImageButtonOnClicked() async {
    image.value = await Common.getImageFromUser();
    return image.value != null;
  }

  Future<bool> onAddPostButtonClicked() async {
    Common.logger.d(titleTextEditingController.text);
    Common.logger.d(image.value!.path);
    Common.logger.d(contentTextEditingController.text);

    if (image.value == null) {
      Get.snackbar("사진 추가", "사진을 추가해주세요", backgroundColor: Colors.white);
    }

    PostData postData = PostData(
      title: titleTextEditingController.text,
      content: contentTextEditingController.text,
    );

    FormData data = FormData.fromMap(
      {
        ...postData.toJson(),
        'image': MultipartFile.fromFile(
          image.value!.path,
          filename: image.value!.name,
        ),
      },
    );

    try {
      http.Response response = await http.post(
        Uri.parse("http://192.168.32.1:3000/community"),
        headers: {"Content-Type": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('reservation success');
        return true;
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('reservation fail');
        return false;
      }
    } catch (error) {
      return false;
      // 에러 처리
      // HTTP 요청이 실패했을 때의 에러를 처리하는 코드를 작성합니다.
    }
  }
}
