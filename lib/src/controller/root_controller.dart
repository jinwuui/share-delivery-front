import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  // 어디서든지 찾아서 사용할 수 있도록 해줌
  static RootController get to => Get.find();

  RxInt rootPageIndex = 0.obs;
  RxBool isCategoryPageOpen = false.obs;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }

  Future<bool> onWillPop() async {
    setCategoryPage(false);
    return !await navigatorKey.currentState!.maybePop();
  }

  void setCategoryPage(bool check) {
    isCategoryPageOpen(check);
  }

  void back() {
    setCategoryPage(false);
    onWillPop();
  }
}
