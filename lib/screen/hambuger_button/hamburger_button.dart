import 'package:anipet/screen/hambuger_button/hamburger_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anipet/const/identification.dart';
import 'package:anipet/main.dart';
import 'package:anipet/manager/name_manager.dart';
import 'package:anipet/manager/userId_manager.dart';
import 'package:anipet/screen/hospital_reservation_record/hospital_reservation_record.dart';
import 'package:anipet/screen/my_information/my_information.dart';
import 'package:anipet/screen/my_post/my_post.dart';

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([UserIdManager.getUserId(), NameManager.getName()]),
      builder: (context, AsyncSnapshot<List<String?>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? userId = snapshot.data?[0];
          String? name = snapshot.data?[1];

          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(TEST_PROFILE_IMG),
                  ),
                  accountName: Text(name ?? ''),
                  accountEmail: Text(userId ?? ''),
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
                  onTap: () async {
                    Map<String?, dynamic>? data = await HamburgerButtonController(userId: userId).onMyInfoButtonClick();
                    Get.to(() => MyInformation(data: data));
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
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
