import 'package:anipet/component/post_list.dart';
import 'package:anipet/screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyProfile(
            id: 'love_pet',
            profileImg: 'asset/img/logo.png',
          ),
          PostList(),
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  final String id;
  final String profileImg;

  const MyProfile({
    required this.id,
    required this.profileImg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 65,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.off(() => MainScreen());
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 15.0,
              ),
              Text(
                id,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.circle_notifications),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      profileImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text('0'),
                  Text('게시물'),
                ],
              ),
              Column(
                children: [
                  Text('0'),
                  Text('팔로워'),
                ],
              ),
              Column(
                children: [
                  Text('0'),
                  Text('팔로잉'),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
    );
  }
}
