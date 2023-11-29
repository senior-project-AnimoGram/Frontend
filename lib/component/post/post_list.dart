import 'package:anipet/component/post/post.dart';
import 'package:anipet/component/post/post_component.dart';
import 'package:anipet/component/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FourCircularImagesRow extends StatelessWidget {
  final List<String> imagePaths = [
    'https://media.istockphoto.com/id/509052128/ko/%EC%82%AC%EC%A7%84/%EA%B3%A8%EB%93%A0-%EB%A6%AC%ED%8A%B8%EB%A6%AC%EB%B2%84-%EC%95%89%EC%95%84-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD-%EC%A0%84%EB%A9%B4-a.jpg?s=612x612&w=0&k=20&c=VY8wVdZV1XTw-Aq4iPhfTFu4hBeFJgQonj2qlAvbo4Q=',
    'https://cdn.pet-news.or.kr/news/photo/202304/2903_4444_3536.jpg',
    'https://mblogthumb-phinf.pstatic.net/MjAyMTA4MTFfMTE3/MDAxNjI4NjcyNzQ4NTQ2.T133t6tAHabBzWbppx5iOuzADghEdCnVcwyk9nU3vNYg.Q_0VVTFcTHzZmYjqyAgufTrTgjEEJxlegvGqBoFLzq8g.JPEG.goodnonz/SE-783ce041-69f0-43eb-81c1-73591a7054a6.jpg?type=w800',
    'https://animalspet.co.kr/web/product/medium/202303/87006965eb2422d857fa7b69f471a7cd.jpg',
  ];
  final List<String> imageTitles = [
    '골든 리트리버',
    '웰시코기',
    '사모예드',
    '포메라니안',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          imagePaths.length,
              (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                // 강아지 종류별로 정렬하는 이벤트 핸들러
                print('Button $index pressed');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(imagePaths[index]),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    imageTitles[index],
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  int? _selectedButton = 0;
  late Future<List<Post>> _posts;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _posts = PostController.fetchPosts();
  }

  Future<void> _refresh() async {
    setState(() {
      _posts = PostController.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _posts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // 로딩 표시
        } else if (snapshot.hasError) {
          return Text('오류: ${snapshot.error}');
        } else {
          // 가져온 데이터를 사용하여 게시물을 표시
          List<Post> posts = snapshot.data!;
          return Expanded(
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      FourCircularImagesRow(),
                      SizedBox(height: 20.0),
                      ToggleSwitch(
                        minWidth: 80.0,
                        initialLabelIndex: _selectedButton!,
                        cornerRadius: 30.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey[200],
                        inactiveFgColor: Colors.black,
                        labels: ['추천', '팔로우'],
                        onToggle: (index) {
                          setState(() {
                            _selectedButton = index;
                          });
                        },
                      ),
                      SizedBox(height: 10.0),
                      for (Post post in posts)
                        PostComponent(
                          id: post.id,
                          profileImg: post.profileImg,
                          imageAddress: post.imagePath,
                          title: post.title,
                          content: post.content,
                          numberOfComment: post.commentNum,
                          numberOflikes: post.goodNum,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}


class RoundedButton extends StatelessWidget {
  final String label;

  const RoundedButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }
}
