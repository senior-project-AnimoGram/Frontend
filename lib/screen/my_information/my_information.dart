import 'package:anipet/component/snackbar/snackbar.dart';
import 'package:anipet/const/identification.dart';
import 'package:anipet/manager/name_manager.dart';
import 'package:anipet/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../manager/token_manager.dart';
import '../../manager/userId_manager.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key, required this.data}) : super(key: key);

  final Map<String?, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    const TextStyle categoryStyle = TextStyle(
      fontSize: 16.5,
    );
    const double categoryWidth = 80;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          '나의 정보',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Row(
                    children: [
                      Text(
                        '회원가입 정보',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        '이름',
                        style: categoryStyle,
                      ),
                    ),
                    Text('조윤상'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        'ID',
                        style: categoryStyle,
                      ),
                    ),
                    Text('jsy4407' ?? 'N/A'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        '전화번호',
                        style: categoryStyle,
                      ),
                    ),
                    Text('010-0000-0000'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Row(
                    children: [
                      Text(
                        '나의 반려동물',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        '이름',
                        style: categoryStyle,
                      ),
                    ),
                    Text('우유'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        '종',
                        style: categoryStyle,
                      ),
                    ),
                    Text('사모예드'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: categoryWidth,
                      child: Text(
                        '나이',
                        style: categoryStyle,
                      ),
                    ),
                    Text('7'),
                    Text('세'),
                  ],
                ),
                Spacer(), // Add Spacer to push the button to the bottom
                Container(
                  width: 150,
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      await TokenManager.clearToken();
                      await UserIdManager.clearUserId();
                      await NameManager.clearName();
                      showSnackBar(context, '로그아웃 되었습니다.');
                      Get.offAll(() => const SplashScreen());
                    },
                    child: Text('로그아웃'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
