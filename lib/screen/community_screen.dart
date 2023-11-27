import 'package:flutter/material.dart';

import '../component/post_list.dart';
import '../component/status_bar.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 10.0),
        StatusBar(comment: '오늘은 애완동물과 어떤 일이 있으셨나요?'),
        SizedBox(height: 10.0),
        PostList(),
      ],
    );
  }
}
