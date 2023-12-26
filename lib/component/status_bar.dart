import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/add_post/add_post_screen.dart';

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
        Get.to(() =>  AddPostScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              const SizedBox(
                width: 20.0,
              ),
              const Icon(
                Icons.add_box_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
