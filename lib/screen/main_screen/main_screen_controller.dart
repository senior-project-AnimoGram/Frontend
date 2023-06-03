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

  RxBool hospitalState = true.obs;
  RxBool adoptionState = false.obs;
  RxBool communityState = false.obs;
  RxBool tipState = false.obs;

  @override
  void onInit() {
    pages.add(const HospitalScreen());
    pages.add(const AdoptionScreen());
    pages.add(const CommunityScreen());
    pages.add(const TipScreen());

    super.onInit();
  }
}
