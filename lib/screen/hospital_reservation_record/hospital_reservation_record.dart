import 'package:anipet/screen/hospital_reservation_record/hospital_record_list.dart';
import 'package:flutter/material.dart';

class HospitalReservationRecord extends StatelessWidget {
  const HospitalReservationRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          '병원예약 기록',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child:  Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                HospitalRecordList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
