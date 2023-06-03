import 'package:anipet/const/identification.dart';
import 'package:anipet/main.dart';
import 'package:anipet/screen/hospital_reservation_record/hospital_reservation_record.dart';
import 'package:anipet/screen/my_information/my_information.dart';
import 'package:anipet/screen/my_post/my_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(TEST_PROFILE_IMG),
            ),
            accountName: const Text(TEST_ID),
            accountEmail: const Text(TEST_EMAIL),
            onDetailsPressed: () {
              Common.logger.d('Hello, My Hope World!');
            },
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: const Text('나의 정보'),
            onTap: () {
              Get.to(() => const MyInformation());
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: const Text('내 게시글'),
            onTap: () {
              Get.to(() => const MyPost());
            },
            trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: const Text('병원예약 기록'),
            onTap: () {
              Get.to(() => const HospitalReservationRecord());
            },
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
