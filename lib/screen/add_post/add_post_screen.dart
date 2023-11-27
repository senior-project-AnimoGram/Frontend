import 'dart:io';

import 'package:anipet/screen/add_post/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddPostController addPostController = Get.put(AddPostController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          'Add Post',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              _TextAndTextField(
                textString: 'Title',
                isObsecureTextTrue: false,
                textEditingController: addPostController.titleTextEditingController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Obx(() => addPostController.image.value == null
                  ? ElevatedButton(
                      onPressed: () {
                        addPostController.addImageButtonOnClicked();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('사진 추가'),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 200,
                          child: Image.file(
                            File(addPostController.image.value!.path),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )),
              const SizedBox(
                height: 30.0,
              ),
              _TextAndTextField(
                textString: 'Content',
                isObsecureTextTrue: false,
                textEditingController: addPostController.contentTextEditingController,

              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool result = await addPostController.onAddPostButtonClicked();
                  // Get.offAll(() => const MainScreen());
                  if (result) {
                    Get.back();
                  } else {
                    Get.snackbar("API 오류", "네트워크 연결을 확인해주세요", backgroundColor: Colors.white);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text('포스트 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextAndTextField extends StatelessWidget {
  final String textString;
  final bool isObsecureTextTrue;
  final TextEditingController textEditingController;

  const _TextAndTextField({
    required this.textString,
    required this.isObsecureTextTrue,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          SizedBox(
            width: 65.0,
            child: Text(textString, style: textStyle),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: SizedBox(
              height: 33.0,
              child: TextField(
                obscureText: isObsecureTextTrue,
                decoration: textFieldDecoration,
                controller: textEditingController,
              ),
            ),
          ),
          const SizedBox(width: 10.0)
        ],
      ),
    );
  }
}
