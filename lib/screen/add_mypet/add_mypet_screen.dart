import 'package:anipet/component/snackbar/snackbar.dart';
import 'package:anipet/screen/add_mypet/add_mypet_controller.dart';
import 'package:anipet/screen/login/login_screen.dart';
import 'package:anipet/screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/bottom_button.dart';
import '../../component/text_and_textfield.dart';
import '../../const/colors.dart';

class AddMypetScreen extends StatelessWidget {
  final String userId;
  const AddMypetScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddMypetController addMypetController = Get.put(AddMypetController(userId: userId));
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
                  petNameTextController: addMypetController.petNameTextController,
                  breedTextController: addMypetController.breedTextController,
                  ageTextController: addMypetController.ageTextController,
                ),
                BottomButton(
                  buttonName: 'Add My Pet',
                  onPressed: () async {
                    await addMypetController.onAddMypetButtonClicked();
                    showSnackBar(context, '펫 정보가 저장되었습니다. 다시 로그인 해주세요.');
                    Get.offAll(() => const LogInScreen());

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
  final TextEditingController petNameTextController;
  final TextEditingController breedTextController;
  final TextEditingController ageTextController;

  const _Input({required this.petNameTextController, required this.breedTextController, required this.ageTextController, Key? key}) : super(key: key);

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
                'My Pet',
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
              textString: 'Pet Name',
              isObsecureTextTrue: false,
              textEditingController: petNameTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextAndTextField(
              textString: 'Breed',
              isObsecureTextTrue: false,
              textEditingController: breedTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextAndTextField(
              textString: 'Age',
              isObsecureTextTrue: false,
              textEditingController: ageTextController,
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
