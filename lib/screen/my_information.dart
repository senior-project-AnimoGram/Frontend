import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle categotyStyle = TextStyle(
      fontSize: 16.5,
    );
    final double categoryWidth = 80;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          '나의 정보',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Row(
                    children: [
                      Text(
                        '회원가입 정보',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: categoryWidth,
                      child: Text(
                        'Email',
                        style: categotyStyle,
                      ),
                    ),
                    Text('petlover@naver.com'),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: categoryWidth,
                      child: Text(
                        'Id',
                        style: categotyStyle,
                      ),
                    ),
                    Text('love_pet'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '나의 반려동물',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                MyPetInfo(
                  categoryWidth: categoryWidth,
                  categoryStyle: categotyStyle,
                  petName: '토피',
                  breed: '이구아나',
                  age: '3',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPetInfo extends StatelessWidget {
  final double categoryWidth;
  final TextStyle categoryStyle;
  final String petName;
  final String breed;
  final String age;

  const MyPetInfo({
    required this.categoryWidth,
    required this.categoryStyle,
    required this.petName,
    required this.breed,
    required this.age,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: categoryWidth,
              child: Text(
                '이름',
                style: categoryStyle,
              ),
            ),
            Text(petName),
          ],
        ),
        Row(
          children: [
            Container(
              width: categoryWidth,
              child: Text(
                '종',
                style: categoryStyle,
              ),
            ),
            Text(breed)
          ],
        ),
        Row(
          children: [
            Container(
              width: categoryWidth,
              child: Text(
                '나이',
                style: categoryStyle,
              ),
            ),
            Text(age),
            Text('세'),
          ],
        ),
        //picture;
      ],
    );
  }
}
