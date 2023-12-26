import 'package:anipet/const/baseurl.dart';
import 'package:anipet/main.dart';
import 'package:anipet/manager/userId_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'decorate_picture_screen.dart';

class AddPostController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();

  Rxn<XFile> image = Rxn();
  // picture

  Future<bool> addImageButtonOnClicked() async {

    image.value = await Common.getImageFromUser();

    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
    );
    // 예측값 받아오기
    var result = await predictImage();
    Get.to(() => DecorateScreen(photo: image.value!, breed: result[0]['label'], emotion: result[1]['label'])); // 사진을 갖고오면 꾸미기 화면으로 이동
    return image.value != null;
  }

  Future<List<dynamic>> predictImage() async {
    // Specify the path to your TFLite model
    var breed_result;
    var emotion_result;
    try {
      await Tflite.loadModel(
        model: 'asset/model/breed_model.tflite',
        labels: 'asset/model/breed_label.txt'
      );
      breed_result = await Tflite.runModelOnImage(
        path: image.value!.path,
      );

      await Tflite.loadModel(
        model: 'asset/model/emotion_model.tflite',
          labels: 'asset/model/emotion_label.txt'
      );

      emotion_result = await Tflite.runModelOnImage(
        path: image.value!.path,
      );
      print(emotion_result);
    } on Exception catch (e) {
      print("예외: $e");
    }

    List<dynamic?> result = [breed_result[0], emotion_result[0]];
    return result;
  }
  Future<bool> onAddPostButtonClicked(String imagePath) async {
    Common.logger.d(titleTextEditingController.text);
    Common.logger.d(contentTextEditingController.text);

    if (image.value == null) {
      Get.snackbar("사진 추가", "사진을 추가해주세요", backgroundColor: Colors.white);
      return false;
    }
    String path;
    int flag = 0;
    Common.logger.d(image.value!.path);
    if(imagePath != null){
      flag = 1;
    }else {
      path = image.value!.path;
    }
    Dio dio = Dio();
    FormData data;
    String? userId = await UserIdManager.getUserId();
    try {
        if(flag == 0){
          data = FormData.fromMap({ // 안꾸민경우
            'flag': 0,
            'title': titleTextEditingController.text,
            'content': contentTextEditingController.text,
            'userId': userId,
            'image': await MultipartFile.fromFile(
              image.value!.path,
              filename: userId! + '_' + image.value!.name,
            ),
        } );
        }else {
          data = FormData.fromMap({
            'flag': 1, // 꾸민경우
            'title': titleTextEditingController.text,
            'content': contentTextEditingController.text,
            'userId': userId,
            'filepath': imagePath
          });
        }


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



