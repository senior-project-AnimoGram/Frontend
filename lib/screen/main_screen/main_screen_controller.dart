import 'package:anipet/screen/adoption_screen.dart';
import 'package:anipet/screen/community_screen.dart';
import 'package:anipet/screen/hospital_screen.dart';
import 'package:anipet/screen/tip_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxString appBarText = "커뮤니티".obs;

  RxList<Widget> pages = RxList();
  RxInt pageIndex = 2.obs;

  RxBool hospitalState = false.obs;
  RxBool adoptionState = false.obs;
  RxBool communityState = true.obs;
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
