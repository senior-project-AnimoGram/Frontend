import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalComponent extends StatelessWidget {
  final String hospitalName;
  final String hospitalAddress;

  const HospitalComponent({
    required this.hospitalName,
    required this.hospitalAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xffF9F9ff),
        border: Border.all(
          width: 1,
          color: Color(0xffb3b5b4),
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
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ), //hospital name
            SizedBox(
              height: 5.0,
            ),
            Text(hospitalAddress), //hospital address
          ],
        ),
      ),
    );
  }
}
