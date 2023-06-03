import 'package:anipet/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdoptionWebview extends StatelessWidget {
  const AdoptionWebview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('입양'),
        backgroundColor: MAIN_BLUE_COLOR,
      ),
      body: WebView(
        initialUrl: value,
      ),
    );
  }
}
