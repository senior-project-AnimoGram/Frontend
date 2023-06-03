import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyPostController extends GetxController {
  Dio dio = Dio();

  RxList<PostData> postList = RxList();

  // Future<void> fetchData() async {
  //   await dio.get("http://localhost:3000/api/mypost");
  // }

  Future<void> fetchData() async {
    var res = await http.get(Uri.parse("http://192.168.32.1:3000/users"));
    List<Map<String, dynamic>> jsonArray = json.decode(res.body);

    for (var jsonData in jsonArray) {
      PostData postData = PostData.fromJson(jsonData);
      postList.add(postData);
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchData();
    //postList.add(PostData(title: "안녕하세요", content: "ㅎㅇ"));
    //postList.add(PostData(title: "안녕하세요1", content: "ㅎㅇ1"));
    //postList.add(PostData(title: "안녕하세요2", content: "ㅎㅇ2"));
  }
}

class PostData {
  String? title;
  String? content;

  PostData({this.title, this.content});

  PostData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
