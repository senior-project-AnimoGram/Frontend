import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HospitalReservationRecordController extends GetxController {
  Dio dio = Dio();

  RxList<ReservationData> reservationList = RxList();

  Future<void> fetchData() async {
    var res = await http.get(Uri.parse("http://192.168.32.1:3000/users"));
    List<Map<String, dynamic>> jsonArray = json.decode(res.body);

    for (var jsonData in jsonArray) {
      ReservationData reservationData = ReservationData.fromJson(jsonData);
      reservationList.add(reservationData);
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchData();
    //postList.add(PostData(title: "안녕하세요", content: "ㅎㅇ"));
    //postList.add(PostData(title: "안녕하세요1", content: "ㅎㅇ1"));
    //postList.add(PostData(title: "안녕하세요2", content: "ㅎㅇ2"));
  }
}

class ReservationData {
  String? hospitalName;
  String? reservationDay;
  String? reservationTime;
  String? petName;
  String? breed;
  String? age;
  String? visitingReason;

  ReservationData({this.hospitalName, this.reservationDay, this.reservationTime, this.petName, this.breed, this.age, this.visitingReason});

  ReservationData.fromJson(Map<String, dynamic> json) {
    hospitalName = json['hospitalName'];
    reservationDay = json['reservationDay'];
    reservationTime = json['reservationTime'];
    petName = json['petName'];
    breed = json['breed'];
    age = json['age'];
    visitingReason = json['visitingReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hospitalName'] = hospitalName;
    data['reservationDay'] = reservationDay;
    data['reservationTime'] = reservationTime;
    data['petName'] = petName;
    data['breed'] = breed;
    data['age'] = age;
    data['visitingReason'] = visitingReason;
    return data;
  }
}
