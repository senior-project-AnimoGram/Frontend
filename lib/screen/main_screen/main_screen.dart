import 'package:anipet/component/topmenu_bar/topmenu_bar.dart';
import 'package:anipet/const/colors.dart';
import 'package:anipet/screen/hamburger_button.dart';
import 'package:anipet/screen/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.appBarText.value,
            )),
        foregroundColor: Colors.black,
        //leading: new Icon(Icons.menu),
        backgroundColor: MAIN_BLUE_COLOR,
        elevation: 0,
      ),
      drawer: const HamburgerButton(),
      body: Column(
        children: [
          const TopMenuBar(),
          Obx(
            () => Expanded(
              child: controller.pages[controller.pageIndex.value],
            ),
          ),
        ],
      ),
    );
  }
}
