import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/pick_receiving_location.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/pick_store_category.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class DeliveryRoomRegister extends GetView<DeliveryRoomRegisterController> {
  const DeliveryRoomRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: Stack(
          children: [
            fillDetails(),
            MediaQuery.of(context).viewInsets.bottom != 0
                ? AnimatedPositioned(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 0,
                    right: 0,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12, width: 1),
                          ),
                          color: Colors.white),
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.keyboard_hide_outlined,
                              size: 25),
                          onPressed: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => Get.back(),
        child: const Text("닫기", style: TextStyle(color: Colors.black)),
      ),
      title: const Text(
        "배달 모집글 등록",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.WRITING_MENU),
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ],
    );
  }

  Widget fillDetails() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller.content,
                // controller: controller.deliveryRoomContent,
                textInputAction: TextInputAction.next,
                maxLength: 30,
                decoration: InputDecoration(
                  hintText: "글 제목",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              const Divider(height: 0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.storeLink,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "배달 가게 링크",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      ClipboardData? data =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      if (data == null) {
                        GetSnackbar.on("알림", "클립보드에 저장된 내용이 없습니다.");
                      } else {
                        print(data.text);
                        controller.storeLink.text = data.text!;
                      }
                    },
                    child: const Text("붙여넣기"),
                  ),
                ],
              ),
              const Divider(height: 0),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "배달팁",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              const Divider(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("참여 인원"),
                  ToggleButtons(
                    color: Colors.grey,
                    fillColor: Colors.orange,
                    selectedColor: Colors.white,
                    children: [
                      toggleBtnText("2"),
                      toggleBtnText("3"),
                      toggleBtnText("4"),
                    ],
                    isSelected: controller.numOfPeopleSelections,
                    onPressed: (int index) {
                      controller.selectNumOfPeopleSelections(index);
                    },
                  ),
                ],
              ),
              const Divider(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "집결지 : ${controller.descriptionOfReceivingLocation.text.isEmpty ? "" : controller.descriptionOfReceivingLocation.text}"),
                  OutlinedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        const PickReceivingLocation(),
                        isScrollControlled: true,
                      );
                    },
                    child: const Text("설정"),
                  )
                ],
              ),
              const Divider(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("음식 카테고리 : ${controller.getPickedStoreCategory()}"),
                  OutlinedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        const PickStoreCategory(),
                        isScrollControlled: true,
                      );
                    },
                    child: const Text("설정"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleBtnText(String content) {
    return Text(
      content,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
    );
  }
}
