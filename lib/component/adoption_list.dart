import 'package:flutter/material.dart';

import 'abandoned_animal_component.dart';

class AdoptionList extends StatelessWidget {
  const AdoptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              AbandonedAnimalComponent(
                imageAddress:
                    'https://cdn.famtimes.co.kr/news/photo/202012/502160_3250_588.png',
                dogName: '도치',
                breed: '고슴도치',
                residence: '경기도 용인시 수지구',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageAddress:
                    'http://image.dongascience.com/Photo/2019/01/8fcd4224d019800a2023103a8cb7730e.jpg',
                dogName: '구아나',
                breed: '이구아나',
                residence: '서울시 광진구',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageAddress:
                    'https://images.mypetlife.co.kr/content/uploads/2019/09/09152804/ricky-kharawala-adK3Vu70DEQ-unsplash-1536x1018.jpg',
                dogName: '햄찌',
                breed: '골든 햄스터',
                residence: '전라도 광주',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
