import 'package:anipet/const/identification.dart';
import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle categoryStyle = TextStyle(
      fontSize: 16.5,
    );
    const double categoryWidth = 80;
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
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
                      SizedBox(
                        width: categoryWidth,
                        child: Text(
                          'Email',
                          style: categoryStyle,
                        ),
                      ),
                      Text(TEST_EMAIL),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: categoryWidth,
                        child: Text(
                          'Id',
                          style: categoryStyle,
                        ),
                      ),
                      Text(TEST_ID),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: Row(
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
                  Row(
                    children: [
                      SizedBox(
                        width: categoryWidth,
                        child: Text(
                          '이름',
                          style: categoryStyle,
                        ),
                      ),
                      Text(TEST_PET_NAME),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: categoryWidth,
                        child: Text(
                          '종',
                          style: categoryStyle,
                        ),
                      ),
                      Text(TEST_BREED),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: categoryWidth,
                        child: Text(
                          '나이',
                          style: categoryStyle,
                        ),
                      ),
                      Text(TEST_AGE),
                      Text('세'),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
