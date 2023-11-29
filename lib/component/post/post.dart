import 'package:anipet/const/identification.dart';

class Post {
  final String id;
  final String profileImg = TEST_PROFILE_IMG;
  final String imagePath;
  final String title;
  final String content;
  final int commentNum;
  final int goodNum;

  Post({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.content,
    required this.commentNum,
    required this.goodNum,
  });
}