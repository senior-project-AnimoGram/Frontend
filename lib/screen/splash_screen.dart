import 'package:anipet/screen/login/login_screen.dart';
import 'package:anipet/screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAIN_IVORY_COLOR,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo.png',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Ani Pet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              '애완동물의 모든 것',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90.0,
                  height: 38.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => LogInScreen());
                    },
                    child: Text('Log In'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 35.0,
                ),
                Container(
                  width: 90.0,
                  height: 38.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => SignUpScreen());
                    },
                    child: Text('Sign Up'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
