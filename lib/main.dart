import 'package:anipet/screen/main_screen/main_screen.dart';
import 'package:anipet/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'manager/token_manager.dart';
import 'manager/userId_manager.dart';

Future<void> main() async {
  Get.put(Common());
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await TokenManager.getToken();
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: token != null && !TokenManager.isTokenExpired(token) ? MainScreen() : SplashScreen(),
    ),
  );
}

class Common extends GetxService {
  static Common get instance => Get.find<Common>();
  static Logger logger = Logger();

  static Future<XFile?> getImageFromUser() async {
    XFile? image;
    String? select = await Get.bottomSheet(
      Container(
        color: Colors.white,
        child: SafeArea(
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.back(result: 'camera');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: const Text('카메라', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: const VerticalDivider(
                    thickness: 1,
                    width: 1,
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.back(result: 'photo');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: const Text('갤러리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    if (select == 'camera') {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else if (select == 'photo') {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    return image;
  }
}
