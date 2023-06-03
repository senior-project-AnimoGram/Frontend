import 'package:anipet/component/post_component.dart';
import 'package:anipet/const/identification.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              PostComponent(
                id: 'love_pet',
                profileImg: TEST_PROFILE_IMG,
                imageAddress: 'https://img.hani.co.kr/imgdb/resize/2018/0323/00502545_20180323.JPG',
                title: '고슴도치 입양 근황',
                content: '1달전 입양한 고슴도치 피카가 잘 크고 있어요.',
                numberOfComment: 10,
                numberOflikes: 3,
              ),
              SizedBox(height: 20.0),
              PostComponent(
                id: 'love_pet',
                profileImg: TEST_PROFILE_IMG,
                imageAddress: 'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202203/12/65d8ac3a-d105-4db7-858f-54eb997b8fdb.jpg',
                title: '우리집 골든 햄스터를 소개합니다',
                content: '2살 햄찌에요~',
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
