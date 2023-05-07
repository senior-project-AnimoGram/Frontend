import 'package:anipet/screen/login/login_screen_controller.dart';
import 'package:anipet/screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/big_logo.dart';
import '../../component/bottom_button.dart';
import '../../component/text_and_textfield.dart';
import '../../const/colors.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
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
                //logo
                //Log in
                //Email - ()
                //Password - ()
                const BigLogo(),
                _Input(
                    idTextController: loginScreenController.idTextController,
                    passwordTextController:
                        loginScreenController.passwordTextController),
                BottomButton(
                  buttonName: 'LOGIN',
                  onPressed: () {
                    Get.offAll(() => SignUpScreen());
                    loginScreenController.onLoginButtonClick();
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

  const _Input(
      {required this.idTextController,
      required this.passwordTextController,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log In',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextAndTextField(
            textString: 'Id',
            isObsecureTextTrue: false,
            textEditingController: idTextController,
          ),
          SizedBox(
            height: 30.0,
          ),
          TextAndTextField(
            textString: 'Password',
            isObsecureTextTrue: true,
            textEditingController: passwordTextController,
          ),
        ],
      ),
    );
  }
}
