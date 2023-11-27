import 'package:flutter/material.dart';

import 'abandoned_animal_component.dart';

class AdoptionList extends StatelessWidget {
  const AdoptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child:  Column(
            children: [
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/file/spet/thumb-3740049230_70yd4sAh_f6cb79aa56e48afd9d39dbac6ea4e10557e4cdc1_1000x667.jpg',
                animalName: '톰',
                breed: '골든햄스터',
                residence: '서울특별시 종로구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1708&page=2',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/file/spet/thumb-2948849431_08Rj6UXk_b26c929d8f95c4e4514bc4e374749454157a704c_1000x667.jpg',
                animalName: '델루',
                breed: '데구',
                residence: '대전광역시 유성구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1627&sfl=wr_subject&stx=%EB%8D%B0%EA%B5%AC&sop=and',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/file/spet/thumb-2948849431_mNrjdW02_95867499fbd1f3db782084710197830f29943426_1000x667.jpg',
                animalName: '덕선이',
                breed: '친칠라',
                residence: '대전광역시 유성구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1664&sfl=wr_subject&stx=%EC%B9%9C%EC%B9%A0%EB%9D%BC&sop=and',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/file/spet/thumb-3740049230_aGdVWH3m_f490921b08d77a6a93c9681c118f0816c3b18179_1000x667.jpg',
                animalName: '마이',
                breed: '테디토끼',
                residence: '부산광역시 동래구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1668&sfl=wr_subject&stx=%ED%85%8C%EB%94%94%ED%86%A0%EB%81%BC&sop=and',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/editor/2109/thumb-1b1187d5f5af9b05124e75f177314c43_1630848752_5409_1000x1250.jpg',
                animalName: '밀리언',
                breed: '라쿤',
                residence: '경기도 성남시 중원구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=72&sfl=wr_subject&stx=%EB%9D%BC%EC%BF%A4&sop=and',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/editor/2112/thumb-737e93a29f34e91a38c0c53c96f1a5b7_1639574353_5154_1000x1333.jpg',
                animalName: '준',
                breed: '드워프토끼',
                residence: '부산광역시 해운대구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=441&sfl=wr_subject&stx=%EB%93%9C%EC%9B%8C%ED%94%84&sop=and&page=3',
              ),
              SizedBox(height: 20.0),
              AbandonedAnimalComponent(
                imageUrl: 'http://www.spet1004.com/data/file/spet/thumb-3740049230_L7e58wg1_eaa9849330f3a3da486bc0811e6fe5465fb87427_1000x667.jpg',
                animalName: '온리',
                breed: '기니피그',
                residence: '경기도 수원시 영통구',
                webviewUrl: 'http://www.spet1004.com/bbs/board.php?bo_table=spet&wr_id=1714&sfl=wr_subject&stx=%EA%B8%B0%EB%8B%88%ED%94%BC%EA%B7%B8&sop=and',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
