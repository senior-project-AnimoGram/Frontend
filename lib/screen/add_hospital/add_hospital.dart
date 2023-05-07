import 'package:anipet/screen/add_hospital/add_hostipal_controller.dart';
import 'package:anipet/screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHospital extends StatelessWidget {
  const AddHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddHospitalController addHospitalController =
        Get.put(AddHospitalController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          'Add Hospital',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            _TextAndTextField(
              textString: 'Name',
              isObsecureTextTrue: false,
              textEditingController: addHospitalController.nameTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            _TextAndTextField(
              textString: 'Address',
              isObsecureTextTrue: false,
              textEditingController:
                  addHospitalController.addressTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            _TextAndTextField(
              textString: 'Tel',
              isObsecureTextTrue: false,
              textEditingController: addHospitalController.telTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            _TextAndTextField(
              textString: 'Website',
              isObsecureTextTrue: false,
              textEditingController:
                  addHospitalController.websiteTextController,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                addHospitalController.onHospitalRegisterButtonClick();
                Get.offAll(() => MainScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('병원 등록'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextAndTextField extends StatelessWidget {
  final String textString;
  final bool isObsecureTextTrue;
  final TextEditingController textEditingController;

  const _TextAndTextField({
    required this.textString,
    required this.isObsecureTextTrue,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 65.0,
            child: Text(
              textString,
              style: textStyle,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: SizedBox(
              height: 33.0,
              child: TextField(
                obscureText: isObsecureTextTrue,
                decoration: textFieldDecoration,
                controller: textEditingController,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
    );
  }
}
