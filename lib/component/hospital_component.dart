import 'package:anipet/screen/hospital_reservation/hospital_reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalComponent extends StatelessWidget {
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalTel;
  final String operationHours;

  const HospitalComponent({
    required this.hospitalName,
    required this.hospitalAddress,
    required this.hospitalTel,
    required this.operationHours,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xffF9F9ff),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            Get.to(() => const HospitalReservationScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1,
                color: const Color(0xffb3b5b4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalName,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ), //hospital name
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(hospitalAddress), //hospital address
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(hospitalTel),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [const Text('운영시간 :'), Text(operationHours)],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
