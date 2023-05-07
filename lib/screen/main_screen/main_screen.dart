import 'package:anipet/component/topmenu_bar/topmenu_bar.dart';
import 'package:anipet/screen/hamburger_button.dart';
import 'package:anipet/screen/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.appBarText.value)),
        //leading: new Icon(Icons.menu),
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: HamburgerButton(),
      body: Column(
        children: [
          TopMenuBar(),
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
