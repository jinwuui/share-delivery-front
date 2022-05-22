import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_delivery/src/controller/home/fast_matching/fast_matching_controller.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/ui/widgets/loader_overlay.dart';
import 'package:share_delivery/src/utils/store_categories.dart';

class FastMatching extends GetView<FastMatchingController> {
  const FastMatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: MyLoaderOverlay(
          appBar: controller.isFirstPage()
              ? firstAppBar(context)
              : secondAppBar(context),
          body: AnimatedCrossFade(
            crossFadeState: controller.isFirstPage()
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            firstChild: storeCategory(),
            secondChild: waitMatching(),
          ),
        ),
      ),
    );
  }

  Widget storeCategory() {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.all(8.0),
      color: Colors.grey.shade200,
      child: GridView.builder(
        itemCount: foodCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return category(index);
        },
      ),
    );
  }

  Widget category(int index) {
    String _storeCategory = foodCategories[index].keys.first;

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.setPickedFoodCategory(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: index == controller.pickedFoodCategory.value
                ? Colors.orangeAccent
                : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              _storeCategory,
              style: TextStyle(
                color: index == controller.pickedFoodCategory.value
                    ? Colors.white
                    : Colors.black,
                fontSize: _storeCategory.length < 4 ? 20 : 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget waitMatching() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [],
      ),
    );
  }

  PreferredSizeWidget firstAppBar(BuildContext context) {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => Get.back(),
        child: const Text("닫기", style: appBarAction),
      ),
      title: const Text(
        "빠른 매칭 시작하기",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Obx(
          () => TextButton(
            onPressed: controller.isNotPicked()
                ? null
                : () async {
                    context.loaderOverlay.show();
                    await controller.participateFastMatching();
                    context.loaderOverlay.hide();
                  },
            child: const Text("시작"),
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: appBarAction,
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget secondAppBar(BuildContext context) {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => controller.moveFirstPage(),
        child: const Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      title: const Text(
        "매칭 대기",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
