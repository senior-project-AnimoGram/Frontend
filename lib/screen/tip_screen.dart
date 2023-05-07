import 'package:flutter/material.dart';

import '../component/status_bar.dart';
import '../component/tip_component.dart';

class TipScreen extends StatelessWidget {
  const TipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TopMenuBar(),
        SizedBox(height: 10.0),
        StatusBar(
          comment: '나만의 반려동 기르는 팁을 공유해주세요!',
        ),
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
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
              TipComponent(
                tipTitle: '반려견 환절기 관리 방법',
                tipContent: '환절기에는 반려견의 면역력도 크게 감소..',
                imageUrl:
                    'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMDlfMTMx/MDAxNjY1Mjc3MDA3ODEx.W_QBy_Tz8Zj4W_u8w_3dyshwWRzni-BhcXNWYl7bLoog.oF2towZzS2piacm5aUQFLQcYs7t_hxQmUqnZDCSUKpEg.PNG.startice12/001.png?type=w2',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
