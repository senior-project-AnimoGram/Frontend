import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/add_post_screen.dart';

class StatusBar extends StatelessWidget {
  final String comment;

  const StatusBar({
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAll(() => AddPostScreen());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(comment),
              SizedBox(
                width: 20.0,
              ),
              Icon(
                Icons.add_box_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
