import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class HospitalReservationController extends GetxController {
  Dio dio = Dio();

  TextEditingController hospitalNameTextController = TextEditingController();
  TextEditingController reservationDayTextController = TextEditingController();
  TextEditingController reservationTimeTextController = TextEditingController();

  TextEditingController petNameTextController = TextEditingController();
  TextEditingController breedTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController visitingReasonTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void onHospitalReservationButtonClicked() async {
    try {
      Common.logger.d(hospitalNameTextController.text);
      Common.logger.d(reservationDayTextController.text);
      Common.logger.d(reservationTimeTextController.text);
      Common.logger.d(petNameTextController.text);
      Common.logger.d(breedTextController.text);
      Common.logger.d(ageTextController.text);
      Common.logger.d(visitingReasonTextController.text);

      Response response = await dio.post("http://localhost:3000/reservation", data: {
        'hospitalName': hospitalNameTextController.text,
        'reservationDay': reservationDayTextController.text,
        'reservationTime': reservationTimeTextController.text,
        'petName': petNameTextController.text,
        'breed': breedTextController.text,
        'age': ageTextController.text,
        'visitingReason': visitingReasonTextController.text,
      });

      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('reservation success');
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('reservation fail');
      }
    } catch (error) {
      // 예외 상황 처리
      Common.logger.d('reservation error');
    }
  }
}
