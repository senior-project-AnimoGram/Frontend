import 'package:anipet/const/baseurl.dart';
import 'package:anipet/main.dart';
import 'package:anipet/manager/userId_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'decorate_picture_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddPostController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();
  Rxn<XFile> image = Rxn();
  Rx<LatLng?> newPostLocation = Rx<LatLng?>(null);

  Future<bool> addImageButtonOnClicked() async {
    image.value = await Common.getImageFromUser();
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var result = await predictImage();
    Get.to(() => DecorateScreen(photo: image.value!, breed: 'Golden Retriever', emotion: result[1]['label']));
    return image.value != null;
  }

  Future<List<dynamic>> predictImage() async {
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
      print("EmotionList");
      print(emotion_result);
    } on Exception catch (e) {
      print("예외: $e");
    }

    List<dynamic?> result = [breed_result[0], emotion_result[0]];
    return result;
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      String address = "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      return address;
    } catch (e) {
      print("주소를 가져오는 중 오류가 발생했습니다: $e");
      return "주소를 가져오지 못했습니다";
    }
  }

  Future<String> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    String address = "경기도 성남시 수정구 성남대로 1342";

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      double latitude = position.latitude;
      double longitude = position.longitude;

      newPostLocation.value = LatLng(latitude, longitude); // Store new post location

      address = await getAddress(latitude, longitude);
    }
    return address;
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
        data = FormData.fromMap({
          'flag': 0,
          'title': titleTextEditingController.text,
          'content': contentTextEditingController.text,
          'userId': userId,
          'image': await MultipartFile.fromFile(
            image.value!.path,
            filename: userId! + '_' + image.value!.name,
          ),
          'address': await _getCurrentLocation(),
        } );
      }else {
        data = FormData.fromMap({
          'flag': 1,
          'title': titleTextEditingController.text,
          'content': contentTextEditingController.text,
          'userId': userId,
          'filepath': imagePath,
          'address': await _getCurrentLocation(),
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
        Common.logger.d('reservation success');
        return true;
      } else {
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
