import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_delivery/src/controller/home/fast_matching/fast_matching_controller.dart';
import 'package:share_delivery/src/ui/theme/button_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/ui/widgets/loader_overlay.dart';
import 'package:share_delivery/src/utils/categories.dart';
import 'package:shimmer/shimmer.dart';

class FastMatching extends GetView<FastMatchingController> {
  const FastMatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: MyLoaderOverlay(
          appBar: controller.status.value == FastMatchingStatus.initial
              ? firstAppBar(context)
              : secondAppBar(context),
          body: AnimatedCrossFade(
            crossFadeState:
                controller.status.value == FastMatchingStatus.initial
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            firstChild: selectFoodCategory(),
            secondChild: waitMatching(),
          ),
          // bottomSheet: controller.status.value == FastMatchingStatus.initial
          //     ? null
          //     : buttons(),
        ),
      ),
    );
  }

  Widget selectFoodCategory() {
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
    String _storeCategory = foodCategories[index].kor;

    return Obx(
      () => GestureDetector(
        onTap: () => controller.setPickedFoodCategory(index),
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
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            firstChild: skeletonParticipant(),
            secondChild: participant(),
            crossFadeState:
                controller.status.value == FastMatchingStatus.waiting
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 400),
          ),
          SizedBox(height: Get.height * (Get.height > 700 ? 0.25 : 0.2)),
          acceptButton(),
          refuseButton(),
        ],
      ),
    );
  }

  Widget skeletonParticipant() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          enabled: true,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(radius: 35, backgroundColor: Colors.white),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: Get.width * 0.5,
                        height: 20.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: Get.width * 0.5,
                        height: 20.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: Get.width * 0.4,
                        height: 16.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SpinKitPouringHourGlass(
          color: Colors.brown,
          size: 50.0,
        ),
      ],
    );
  }

  Widget participant() {
    Map<String, dynamic> textObj = controller.textObj;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      textObj["nickname"],
                      style: fastMatchingNickname,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      textObj["mannerScore"].toString(),
                      style: fastMatchingManner,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "거리 - " + textObj["distance"].toString() + " m",
                      style: fastMatchingDistance,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50 * math.sqrt1_2,
          child: Text(
            controller.getFoodCategory(controller.textObj["category"]) +
                " 같이 드실래요?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }

  Widget acceptButton() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 70,
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          child: const Text(
            "같이 주문할게요!",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          style: orangeBtn,
          onPressed: controller.status.value == FastMatchingStatus.waiting
              ? null
              : () {
                  // NOTE : 매칭 상대가 나타나면 버튼 활성화, 매칭 상대가 없으면 비활성화
                  // TODO : 빠른매칭 참여 로직 필요

                  // 1. 매칭 상대방이 나타나면 버튼 활성화 됨

                  // 2. 매칭 상대방
                  print("같이 주문할게요!");
                },
        ),
      ),
    );
  }

  Widget refuseButton() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 70,
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          child: const Text(
            "다른 분들도 만나볼게요!",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          style: greyBtn,
          onPressed: controller.status.value == FastMatchingStatus.waiting
              ? null
              : () {
                  // NOTE : 매칭 상대가 나타나면 버튼 활성화, 매칭 상대가 없으면 비활성화
                  // TODO : 빠른매칭 참여 로직 필요

                  // 1. 매칭 상대방이 나타나면 버튼 활성화 됨

                  // 2. 매칭 상대방
                  print("다른 분들도 만나볼게요!");
                },
        ),
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
                    await Future.delayed(Duration(seconds: 3), () {
                      controller.setStatus(FastMatchingStatus.choosing);
                    });
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
        onPressed: () => controller.setStatus(FastMatchingStatus.initial),
        child: const Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      title: const Text(
        "매칭 대기",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
