import 'package:anipet/manager/name_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/bottom_button.dart';
import '../../component/snackbar/snackbar.dart';
import '../../component/text_and_textfield.dart';
import '../../const/colors.dart';
import '../../manager/token_manager.dart';
import '../../manager/userId_manager.dart';
import '../main_screen/main_screen.dart';
import 'login_screen_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController = Get.put(LoginScreenController());
    return Scaffold(
      backgroundColor: MAIN_IVORY_COLOR,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const BigLogo(),
                _Input(idTextController: loginScreenController.idTextController, passwordTextController: loginScreenController.passwordTextController),
                BottomButton(
                  buttonName: 'LOGIN',
                  onPressed: () async {
                    if(loginScreenController.idTextController.text == ""){
                      showSnackBar(context, '아이디를 입력해주세요');
                      return;
                    }
                    if(loginScreenController.passwordTextController.text == ""){
                      showSnackBar(context, '비밀번호를 입력해주세요');
                      return;
                    }
                    Map<String, dynamic>? data = await loginScreenController.onLoginButtonClick();
                    String? userId;
                    String? name;
                    String? token;
                    loginScreenController.idTextController.text = "";
                    loginScreenController.passwordTextController.text = "";
                    if(data!.isNotEmpty){
                      userId = data['userId'];
                      name = data['name'];
                      token = data['token'];
                    }
                    if (token != null) {
                      await UserIdManager.saveUserId(userId!);
                      await NameManager.saveName(name!);
                      await TokenManager.saveToken(token!);
                      Get.offAll(() => const MainScreen());
                    }
                    else
                      showSnackBar(context, '로그인에 실패했습니다');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final TextEditingController idTextController;
  final TextEditingController passwordTextController;

  const _Input({required this.idTextController, required this.passwordTextController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextAndTextField(
              textString: 'Id',
              isObsecureTextTrue: false,
              textEditingController: idTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextAndTextField(
              textString: 'Password',
              isObsecureTextTrue: true,
              textEditingController: passwordTextController,
            ),
          ],
        ),
      ),
    );
  }
}