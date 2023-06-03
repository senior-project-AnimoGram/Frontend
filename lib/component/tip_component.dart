import 'package:anipet/screen/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipComponent extends StatelessWidget {
  final String tipTitle;
  final String tipContent;
  final String imageUrl;
  final String webviewUrl;

  const TipComponent({
    required this.tipTitle,
    required this.tipContent,
    required this.imageUrl,
    required this.webviewUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const WebviewPage(), arguments: webviewUrl);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            color: const Color(0xffF9F9ff),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 245.0,
                    child: Text(
                      tipTitle,
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ), //hospital name
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 230.0,
                    child: Text(tipContent),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ) //hospital address
                ],
              ),
              Image.network(
                imageUrl,
                height: 85.0,
                width: 85.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
