import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/ui/community/community.dart';
import 'package:share_delivery/src/ui/delivery_history/delivery_history.dart';
import 'package:share_delivery/src/ui/home/home.dart';
import 'package:share_delivery/src/ui/profile/profile.dart';

class Root extends GetView<RootController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: const [
              Home(),
              // RetrofitScreen(),
              DeliveryHistory(),
              Community(),
              Profile(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black54, width: 0.5),
              ),
            ),
            height: 49,
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.rootPageIndex.value,
              onTap: controller.changeRootPageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "홈",
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delivery_dining_outlined),
                  label: "내 배달",
                  activeIcon: Icon(Icons.delivery_dining),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed_outlined),
                  label: "생활공유",
                  activeIcon: Icon(Icons.feed),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label: "프로필",
                  activeIcon: Icon(Icons.person),
                ),
              ],
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
        ),
      ),
    );
  }
}
