import 'dart:convert';
import 'package:anipet/component/post/post.dart';
import 'package:anipet/const/baseurl.dart';
import 'package:dio/dio.dart';

import '../../const/identification.dart';
import '../../main.dart';

class PostController {
  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await Dio().get('$baseUrl/fetchposts');
      final List<dynamic> data = response.data;
      Common.logger.d(data);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => Post(id: item['user_id'], imagePath: item['imagePath'], title: item['title'], content: item['content'],
            commentNum: item['commentNum'], goodNum: item['goodNum'], address: item['address'])).toList();
      } else {
        throw Exception('게시물 로드 실패');
      }
    } catch (e) {
      throw Exception('네트워크 오류: $e');
    }
  }
}
