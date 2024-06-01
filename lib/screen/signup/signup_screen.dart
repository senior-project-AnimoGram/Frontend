import 'package:anipet/component/snackbar/snackbar.dart';
import 'package:anipet/screen/add_mypet/add_mypet_screen.dart';
import 'package:anipet/screen/signup/signup_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/bottom_button.dart';
import '../../component/text_and_textfield.dart';
import '../../const/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupScreenController signupScreenController = Get.put(SignupScreenController());
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
                _Input(
                  nameTextController: signupScreenController.nameTextController,
                  phoneTextController: signupScreenController.phoneTextController,
                  idTextController: signupScreenController.idTextController,
                  passwordTextController: signupScreenController.passwordTextController,
                ),
                BottomButton(
                  buttonName: 'SIGNUP',
                  onPressed: () async {
                    await signupScreenController.onSignupButtonClick();
                    showSnackBar(context, '환영합니다. 펫 정보를 입력해주세요');
                    Get.to(() => AddMypetScreen(userId: signupScreenController.idTextController.text)); // userId도 같이 넘겨줌

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
  final TextEditingController nameTextController;
  final TextEditingController phoneTextController;
  final TextEditingController idTextController;
  final TextEditingController passwordTextController;

  const _Input({required this.nameTextController, required this.phoneTextController, required this.idTextController, required this.passwordTextController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Sign up',
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
              textString: 'nickname',
              isObsecureTextTrue: false,
              textEditingController: nameTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextAndTextField(
              textString: 'Phone Number',
              isObsecureTextTrue: false,
              textEditingController: phoneTextController,
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
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
