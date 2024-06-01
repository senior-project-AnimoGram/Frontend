import 'dart:io';
import 'package:anipet/screen/add_post/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'decorate_picture_controller.dart';


class DecorateScreen extends StatefulWidget {
  final DecorateController addPostController = Get.put(DecorateController());
  final XFile? photo;
  final String? breed;
  final String? emotion;

  DecorateScreen({required this.photo, required this.breed, required this.emotion});

  @override
  _DecorateScreenState createState() => _DecorateScreenState();
}

class _DecorateScreenState extends State<DecorateScreen> {
  String? firstResultCharacter;
  bool filterSelected = false;
  int selectedFilterIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
                Get.dialog(
                Center(
                  child: CircularProgressIndicator(),
                ),
                barrierDismissible: false, // 사용자가 다이얼로그 외부를 터치하여 닫지 못하게 함
              );
              // dynamic? result = await widget.addPostController.putSticker(widget.photo, selectedFilterIndex);
              // if (result != null){
              //   Get.to(() => AddPostScreen(decorate_image_path: result));
              // }

                Get.to(() => AddPostScreen(decorate_image_path: "asset/img/filteredDog.jpg"));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.pets, color: Colors.brown, size: 40,), // Add the icon you want here
              SizedBox(width: 5),
              Text(widget.breed!, style: TextStyle(fontSize: 18),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_emotions_outlined, color: Colors.teal, size: 40), // ,Add the icon you want here
              SizedBox(width: 5),
              Text(widget.emotion!, style: TextStyle(fontSize: 18)),
            ],
          ),
          if (widget.photo != null)
            Image.file(
              File(widget.photo!.path),
              fit: BoxFit.contain,
            ),
          SizedBox(height: 20),
          Container(
            width: 400,
            height: 120,
            color: Colors.black45,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            firstResultCharacter = null;
                          });
                        },
                        child: const Text(
                          '내 필터',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          saveFirstResultCharacter(widget.emotion);
                          print("char: ${firstResultCharacter!}");
                        },
                        child: const Text(
                          '추천',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'NEW',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset('asset/filter/trash.png'),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset('asset/filter/restriction.png'),
                        ),
                      ),
                      SizedBox(width: 20),
                      if (firstResultCharacter == 'angry' ||
                          firstResultCharacter == null)
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(
                              color: selectedFilterIndex == 0 ? Colors.black : Colors.transparent, // Set border color based on selection
                              width: 2.5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedFilterIndex = 0;
                              });
                            },
                            child:
                            Image.asset('asset/filter/redAngryFilter.png'),
                          ),
                        ),
                      SizedBox(width: 20),
                      if (firstResultCharacter == 'happy' ||
                          firstResultCharacter == null)
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(
                              color: selectedFilterIndex == 1 ? Colors.black : Colors.transparent, // Set border color based on selection
                              width: 2.5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedFilterIndex = 1;
                              });
                            },
                            child: Image.asset('asset/filter/happyFace.png'),
                          ),
                        ),
                      SizedBox(width: 20),
                      if (firstResultCharacter == 'relaxed' ||
                          firstResultCharacter == null)
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(
                              color: selectedFilterIndex == 2 ? Colors.black : Colors.transparent, // Set border color based on selection
                              width: 2.5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedFilterIndex = 2;
                              });
                            },
                            child: Image.asset('asset/filter/relaxedFace.png'),
                          ),
                        ),
                      SizedBox(width: 20),
                      if (firstResultCharacter == 'sad' ||
                          firstResultCharacter == null)
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            border: Border.all(
                              color: selectedFilterIndex == 3 ? Colors.black : Colors.transparent, // Set border color based on selection
                              width: 2.5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedFilterIndex = 3;
                              });
                            },
                            child: Image.asset('asset/filter/sadSticker.png'),
                          ),
                        ),
                      // Add more filter options here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveFirstResultCharacter(String? emotion) {
    setState(() {
      firstResultCharacter = emotion;
    });
  }
}


