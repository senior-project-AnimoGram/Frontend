import 'package:anipet/screen/hospital_record_component.dart';
import 'package:flutter/material.dart';

class HospitalRecordList extends StatelessWidget {
  const HospitalRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HospitalRecordComponent(
            hospitalName: '도그마루 병원',
            reservationDay: '2023.05.03',
            reservationTime: '13:30',
            petName: '구아나',
            breed: '이구아나',
            age: '3',
            visitingReason: '먹이를 먹지 않음',
          ),
        ],
      ),
    );
  }
}
