import 'package:anipet/screen/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          SizedBox(height: 8.0),
          Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController =
                        Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 0;
                    mainScreenController.appBarText.value = "주변 특수동물병원 안내";
                  },
                  icon: Icon(Icons.map_outlined),
                  iconSize: 27.0,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController =
                        Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 1;
                    mainScreenController.appBarText.value = "입양";
                  },
                  icon: Icon(Icons.pets_outlined),
                  iconSize: 27.0,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController =
                        Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 2;
                    mainScreenController.appBarText.value = "커뮤니티";
                  },
                  icon: Icon(Icons.people_outline),
                  iconSize: 27.0,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController =
                        Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 3;
                    mainScreenController.appBarText.value = "팁";
                  },
                  icon: Icon(Icons.tips_and_updates_outlined),
                  iconSize: 27.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
