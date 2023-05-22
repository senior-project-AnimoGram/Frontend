import 'package:anipet/screen/hospital_reservation_record.dart';
import 'package:anipet/screen/my_information.dart';
import 'package:anipet/screen/my_post.dart';
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
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('asset/img/logo.png'),
            ),
            accountName: Text('Pet lover'),
            accountEmail: Text('petloverforever@naver.com'),
            onDetailsPressed: () {
              print('Hello, My Hope World!');
            },
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.only(
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
            title: Text('나의 정보'),
            onTap: () {
              Get.to(() => MyInformation());
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: Text('내 게시글'),
            onTap: () {
              Get.to(() => MyPost());
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: Text('병원예약 기록'),
            onTap: () {
              Get.to(() => HospitalReservationRecord());
            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
