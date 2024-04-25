import 'package:flutter/material.dart';

import 'abandoned_animal_component.dart';

class AdoptionList extends StatelessWidget {
  const AdoptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child:  Column(
            children: [
              AbandonedAnimalComponent(
                imageUrl: 'https://cdn.imweb.me/upload/S201711105a050488bde89/3ca885c775835.jpg',
                animalName: '두부',
                breed: '말티즈',
                residence: '부산광역시 동래구',
                webviewUrl: 'https://dmanimal.co.kr/adoption/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=13533315&t=board&category=v1SX81qR62',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'https://cdn.imweb.me/upload/S201711105a050488bde89/a4efe9376097e.jpg',
                animalName: '솜이',
                breed: '포메라니안',
                residence: '울산광역시 남구',
                webviewUrl: 'https://dmanimal.co.kr/adoption/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=13523923&t=board&category=a72c762Z24',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'https://i.namu.wiki/i/MmSNZEv4TguhJ-Sc5PVcQ3_HXSWPWAT9sBEQNNpv3Xv1E7qDtfzw2aqkIbsKH5xEwtpyLZl4v6jKLxtYF33sgw.webp',
                animalName: '톰',
                breed: '골든햄스터',
                residence: '서울특별시 종로구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1708&page=2',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'https://mblogthumb-phinf.pstatic.net/MjAyMTA4MTFfMTE3/MDAxNjI4NjcyNzQ4NTQ2.T133t6tAHabBzWbppx5iOuzADghEdCnVcwyk9nU3vNYg.Q_0VVTFcTHzZmYjqyAgufTrTgjEEJxlegvGqBoFLzq8g.JPEG.goodnonz/SE-783ce041-69f0-43eb-81c1-73591a7054a6.jpg?type=w800',
                animalName: '구름이',
                breed: '사모예드',
                residence: '대전광역시 유성구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1627&sfl=wr_subject&stx=%EB%8D%B0%EA%B5%AC&sop=and',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'https://i.namu.wiki/i/MknyLnPac51lx9ZzAccsUKZVapDxjOkD-9qHCu-g5jburDdhn9VOg2oPE-75u5XQ_1wxWDrf1G8hQ7DLJFs-3A.webp',
                animalName: '델루',
                breed: '골든 리트리버',
                residence: '대전광역시 유성구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1664&sfl=wr_subject&stx=%EC%B9%9C%EC%B9%A0%EB%9D%BC&sop=and',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
