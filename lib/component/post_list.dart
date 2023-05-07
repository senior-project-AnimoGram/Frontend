import 'package:anipet/component/post_component.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              PostComponent(
                id: 'love_pet',
                profileImg: 'asset/img/logo.png',
                imageAddress:
                    'https://img.hani.co.kr/imgdb/resize/2018/0323/00502545_20180323.JPG',
                title: '고슴도치 입양 근황',
                content: '1달전 입양한 고슴도치 피카가 잘 크고 있어요.',
                numberOfComment: 10,
                numberOflikes: 3,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
