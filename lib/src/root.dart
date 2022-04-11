import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/ui/community/community.dart';
import 'package:share_delivery/src/ui/home/home.dart';
import 'package:share_delivery/src/ui/my_delivery/my_delivery.dart';
import 'package:share_delivery/src/ui/profile/profile.dart';

class Root extends GetView<RootController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            leading: controller.isCategoryPageOpen.value
                ? GestureDetector(
                    onTap: controller.back,
                    child: const Icon(Icons.arrow_back_ios),
                  )
                : Container(),
            title: controller.isCategoryPageOpen.value
                ? const Text("테스트")
                : const Text("배달 가치"),
          ),
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: const [
              Home(),
              MyDelivery(),
              Community(),
              Profile(),
              /* GetX 를 통해서 페이지 이동을 하게되면 하단 네비게이션 바까지 덮는 새로운 페이지가 생성됨
              *  새로운 페이지로 이동했을 때, 새 페이지에서도 하단 네비게이션 바가 남아있게 하려면 아래와 같은 방식을 사용함
              */
              // Navigator(
              //   key: controller.navigatorKey,
              //   onGenerateRoute: (routeSettings) {
              //     return MaterialPageRoute(
              //       builder: (context) => const Explore(),
              //     );
              //   },
              // ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
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
                label: '프로필',
                activeIcon: Icon(Icons.person),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
          floatingActionButton: FloatingActionButton.small(
            backgroundColor: const Color.fromRGBO(231, 129, 17, 1),
            onPressed: () {
              // TODO: 배달 모집글 등록 화면으로 이동
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
