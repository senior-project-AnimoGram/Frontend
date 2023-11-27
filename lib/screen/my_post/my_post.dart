import 'package:anipet/component/post_component.dart';
import 'package:anipet/const/identification.dart';
import 'package:anipet/screen/main_screen/main_screen.dart';
import 'package:anipet/screen/my_post/my_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyPostController());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const MyProfile(
              id: TEST_ID,
              profileImg: TEST_PROFILE_IMG,
            ),
            // PostList(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              margin: const EdgeInsets.only(bottom: 20),
              child: const PostComponent(
                id: TEST_ID,
                profileImg: TEST_PROFILE_IMG,
                imageAddress: TEST_POST_IMG_NETWORK,
                title: TEST_TITLE,
                content: TEST_CONTENT,
                numberOfComment: 6,
                numberOflikes: 15,
              ),
            ),
          ],
        ),
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
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.off(() => const MainScreen());
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 15.0,
                  ),
                  Text(
                    id,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.circle_notifications),
                  ),
                ],
              ),
              const SizedBox(
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
                      Text('1'),
                      Text('게시물'),
                    ],
                  ),
                   Column(
                    children: [
                      Text('10'),
                      Text('팔로워'),
                    ],
                  ),
                   Column(
                    children: [
                      Text('23'),
                      Text('팔로잉'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
