import 'package:anipet/const/identification.dart';
import 'package:anipet/screen/hospital_record_component.dart';
import 'package:flutter/material.dart';

class HospitalRecordList extends StatelessWidget {
  const HospitalRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HospitalRecordComponent(
            hospitalName: TEST_HOSPITAL_NAME,
            reservationDay: TEST_RESERVATION_DAY,
            reservationTime: TEST_RESERVATION_TIME,
            petName: TEST_PET_NAME,
            breed: TEST_BREED,
            age: TEST_AGE,
            visitingReason: TEST_VISITING_REASON,
          ),
        ],
      ),
    );
  }
}
