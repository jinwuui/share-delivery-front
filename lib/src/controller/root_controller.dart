import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  static RootController get to => Get.find();

  RxInt rootPageIndex = 0.obs;
  RxBool isCategoryPageOpen = false.obs;
  RxBool isFirstOpenCommunity = true.obs;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
    if (rootPageIndex.value == 2 && isFirstOpenCommunity.value) {
      isFirstOpenCommunity.value = false;
    }
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
