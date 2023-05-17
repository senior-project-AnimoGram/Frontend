import 'package:anipet/screen/hospital_reservation/hospital_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_screen/main_screen.dart';

class HospitalReservationScreen extends StatelessWidget {
  const HospitalReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HospitalReservationController hospitalReservationController =
        Get.put(HospitalReservationController());
    return Scaffold(
      appBar: AppBar(
        title: Text('병원 예약'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
              textString: '예약 병원명',
              isObsecureTextTrue: false,
              textEditingController:
                  hospitalReservationController.hospitalNameTextController),
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
            textString: '예약 날짜',
            isObsecureTextTrue: false,
            textEditingController:
                hospitalReservationController.reservationDayTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
            textString: '예약 시간',
            isObsecureTextTrue: false,
            textEditingController:
                hospitalReservationController.reservationTimeTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
            textString: '진료 동물 이름',
            isObsecureTextTrue: false,
            textEditingController:
                hospitalReservationController.petNameTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
            textString: '진료 동물 종',
            isObsecureTextTrue: false,
            textEditingController:
                hospitalReservationController.breedTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          _TextAndTextField(
            textString: '병원 방문 사유',
            isObsecureTextTrue: false,
            textEditingController:
                hospitalReservationController.visitingReasonTextController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            onPressed: () {
              hospitalReservationController
                  .onHospitalReservationButtonClicked();
              Get.offAll(() => MainScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: const Text('병원 예약'),
          ),
        ],
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
            width: 88.0,
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
