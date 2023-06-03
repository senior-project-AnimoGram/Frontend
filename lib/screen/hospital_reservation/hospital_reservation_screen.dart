import 'package:anipet/screen/hospital_reservation/hospital_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_screen/main_screen.dart';

class HospitalReservationScreen extends StatelessWidget {
  const HospitalReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HospitalReservationController hospitalReservationController = Get.put(HospitalReservationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('병원 예약'),
        backgroundColor: Colors.grey[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _TextAndTextField(textString: '예약 병원명', isObsecureTextTrue: false, textEditingController: hospitalReservationController.hospitalNameTextController),
            _TextAndTextField(
              textString: '예약 날짜',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.reservationDayTextController,
            ),
            _TextAndTextField(
              textString: '예약 시간',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.reservationTimeTextController,
            ),
            _TextAndTextField(
              textString: '동물 이름',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.petNameTextController,
            ),
            _TextAndTextField(
              textString: '종',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.breedTextController,
            ),
            _TextAndTextField(
              textString: '나이',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.ageTextController,
            ),
            _TextAndTextField(
              textString: '병원 방문 사유',
              isObsecureTextTrue: false,
              textEditingController: hospitalReservationController.visitingReasonTextController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  hospitalReservationController.onHospitalReservationButtonClicked();
                  Get.to(() => const MainScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text('병원 예약'),
              ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 95.0,
              child: Text(
                textString,
                style: textStyle,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 270,
              height: 35.0,
              child: TextField(
                obscureText: isObsecureTextTrue,
                decoration: textFieldDecoration,
                controller: textEditingController,
              ),
            ),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
