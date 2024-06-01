import 'package:anipet/component/top_search_bar.dart';
import 'package:flutter/material.dart';

import '../component/tip_component.dart';

class TipScreen extends StatelessWidget {
  const TipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // TopMenuBar(),
        SizedBox(height: 10.0),
        TopSearchBar(),
        SizedBox(height: 10.0),
        TipList(),
      ],
    );
  }
}

class TipList extends StatelessWidget {
  const TipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child:  Column(
            children: [
              TipComponent(
                tipTitle: '청담우리동물병원',
                tipContent: '임신한 반려묘를 돌볼 때 , "이것"만 기억하자',
                imageUrl: 'http://www.chungdamah.co.kr/data/editor/2201/thumb-f232e4f602618ab01b4b096915922cdb_1641279871_5088_900x900.jpg',
                webviewUrl: 'https://m.blog.naver.com/nanabh01/221593068158',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '기니피그가 꼭 피해야할 음식',
                tipContent: '기니피그가 먹지 말아야 할 음식에 어떤 것들이 있는지 알아보자.',
                imageUrl: 'http://www.chemicalnews.co.kr/news/photo/202108/4217_10882_428.png',
                webviewUrl: 'http://www.chemicalnews.co.kr/news/articleView.html?idxno=4217',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '특수동물진료 방학동물병원',
                tipContent: '게코도마뱀 건강검진 & 도마뱀 건강체크법',
                imageUrl:
                    'https://post-phinf.pstatic.net/MjAyMTAxMjlfMTY3/MDAxNjExODU5MDYyOTE5.PZNRDfiZcd4Y6-I9jIjGl8ElEHSei-HOuXf6a2py6H4g.cRdDwTKLRVragkt92scQK434uUPLr3y8AoWQ9c0MnKsg.JPEG/1.jpg?type=w1200',
                webviewUrl: 'https://post.naver.com/viewer/postView.naver?volumeNo=30597274&memberNo=38129688',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려동물 토끼 양육, 이것만은 알자',
                tipContent: '이번 칼럼은 토끼 입양을 고려하는 보호자나 현재 키우는 중인 초보 보호자를 위한...',
                imageUrl: 'https://www.sjpost.co.kr/news/photo/201906/40062_36316_2732.jpg',
                webviewUrl: 'https://m.blog.naver.com/nanabh01/221593068158',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '이구아나가 잘 먹지 않아요',
                tipContent: '이구아나에게 필요한 사육 환경과 먹이를 잘 챙겨 주지 않으면...',
                imageUrl: 'http://image.dongascience.com/Photo/2019/01/8fcd4224d019800a2023103a8cb7730e.jpg',
                webviewUrl: 'https://www.dongascience.com/news.php?idx=26162',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '비만반려동물 증가…',
                tipContent: '반려동물 체중 줄이는 팁',
                imageUrl: 'https://health.chosun.com/site/data/img_dir/2024/01/18/2024011801397_0.jpg',
                webviewUrl: 'https://health.chosun.com/site/data/html_dir/2024/01/18/2024011801400.html',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
