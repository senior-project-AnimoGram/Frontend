import 'package:anipet/component/post_component.dart';
import 'package:anipet/const/identification.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child:  Column(
            children: [
              PostComponent(
                id: 'love_pet',
                profileImg: TEST_PROFILE_IMG,
                imageAddress: 'https://images.immediate.co.uk/production/volatile/sites/3/2020/08/Disney-dogs-ffefe5a.jpg?quality=90&resize=922,615',
                title: '우리집 사모예드',
                content: '1달전 입양한 우유가 잘 크고 있어요.',
                numberOfComment: 10,
                numberOflikes: 3,
              ),
              SizedBox(height: 20.0),
              PostComponent(
                id: 'love_pet',
                profileImg: TEST_PROFILE_IMG,
                imageAddress: 'https://sadanduseless.b-cdn.net/wp-content/uploads/2020/08/disney-eyes12.jpg',
                title: '골든 리트리버',
                content: '2살 골든 리트리버입니다.',
                numberOfComment: 5,
                numberOflikes: 17,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
