import 'package:anipet/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('팁'),
        backgroundColor: MAIN_BLUE_COLOR,
      ),
      body: WebView(
        initialUrl: value,
      ),
    );
  }
}
