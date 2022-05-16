import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WritingMenuController extends GetxController {
  final menuList = <MenuInfo>[].obs;
  // Rx<List<MenuInfo>> menuList = (<MenuInfo>[]).obs;
  int curIdx = 0;

  @override
  void onInit() {
    super.onInit();
    initMenuList();
  }

  void initMenuList() {
    menuList.add(MenuInfo(seq: curIdx++, parent: -1));
  }

  void addMenu() {
    menuList.add(MenuInfo(seq: curIdx++, parent: -1));
  }

  void removeMenu(int idx) {
    bool isOption = menuList[idx].seq == -1;
    if (isOption) {
      menuList.removeAt(idx);
    } else {
      int seq = menuList[idx].seq;
      menuList.removeWhere(
          (element) => element.seq == seq || element.parent == seq);
    }
  }

  void addOption(int parentSeq) {
    for (int i = 0; i < menuList.length; i++) {
      if (menuList[i].seq == parentSeq) {
        menuList.insert(i + 1, MenuInfo(seq: -1, parent: parentSeq));
        break;
      }
    }
  }

  void increaseAmount(int idx) {
    if (menuList[idx].quantity < 99) menuList[idx].quantity++;
    update();
  }

  void decreaseAmount(int idx) {
    if (menuList[idx].quantity > 0) menuList[idx].quantity--;
    update();
  }
}

class MenuInfo {
  late final TextEditingController name;
  late final TextEditingController price;
  int quantity = 1;
  late final int seq;
  late final int parent;
  late final List<MenuInfo> options;

  MenuInfo({required this.seq, required this.parent}) {
    name = TextEditingController();
    price = TextEditingController();
    options = <MenuInfo>[];
  }
}
