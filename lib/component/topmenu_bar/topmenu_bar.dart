import 'package:anipet/const/colors.dart';
import 'package:anipet/screen/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double menuIconSize = 30.0;
    final controller = Get.put(MainScreenController());
    return Container(
      color: MAIN_BLUE_COLOR,
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController = Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 0;
                    mainScreenController.appBarText.value = "지도";

                    mainScreenController.hospitalState.value = true;
                    mainScreenController.adoptionState.value = false;
                    mainScreenController.communityState.value = false;
                    mainScreenController.tipState.value = false;
                  },
                  icon: Obx(() => Icon(
                        controller.hospitalState.value ? Icons.map : Icons.map_outlined,
                      )),
                  iconSize: menuIconSize,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController = Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 1;
                    mainScreenController.appBarText.value = "입양";

                    mainScreenController.hospitalState.value = false;
                    mainScreenController.adoptionState.value = true;
                    mainScreenController.communityState.value = false;
                    mainScreenController.tipState.value = false;
                  },
                  icon: Obx(() => Icon(
                        controller.adoptionState.value ? Icons.favorite : Icons.favorite_border_outlined,
                      )),
                  iconSize: menuIconSize,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController = Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 2;
                    mainScreenController.appBarText.value = "커뮤니티";

                    mainScreenController.hospitalState.value = false;
                    mainScreenController.adoptionState.value = false;
                    mainScreenController.communityState.value = true;
                    mainScreenController.tipState.value = false;
                  },
                  icon: Obx(() => Icon(
                        controller.communityState.value ? Icons.people : Icons.people_outline,
                      )),
                  iconSize: menuIconSize,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    MainScreenController mainScreenController = Get.find<MainScreenController>();
                    mainScreenController.pageIndex.value = 3;
                    mainScreenController.appBarText.value = "팁";

                    mainScreenController.hospitalState.value = false;
                    mainScreenController.adoptionState.value = false;
                    mainScreenController.communityState.value = false;
                    mainScreenController.tipState.value = true;
                  },
                  icon: Obx(() => Icon(controller.tipState.value ? Icons.tips_and_updates : Icons.tips_and_updates_outlined)),
                  iconSize: menuIconSize,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
