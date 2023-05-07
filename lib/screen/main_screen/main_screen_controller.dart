import 'package:anipet/screen/adoption_screen.dart';
import 'package:anipet/screen/community_screen.dart';
import 'package:anipet/screen/hospital_screen.dart';
import 'package:anipet/screen/tip_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxString appBarText = "주변 특수동물병원 안내".obs;

  RxList<Widget> pages = RxList();
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    pages.add(HospitalScreen());
    pages.add(AdoptionScreen());
    pages.add(CommunityScreen());
    pages.add(TipScreen());
    super.onInit();
  }
}
