import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:safe_clipboard/safe_clipboard.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/pick_store_category.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class DeliveryRoomRegister extends GetView<DeliveryRoomRegisterController> {
  const DeliveryRoomRegister({Key? key}) : super(key: key);

  static const double dividerHeight = 40.0;

  Future<void> getClipboard({
    iOSDetectionPattern? iOSDetectionPattern,
    AndroidClipMimeType? androidClipMimeType,
  }) async {
    String clipboardValue;
    try {
      clipboardValue = await SafeClipboard.get(
            iOSDetectionPattern: iOSDetectionPattern,
            androidClipMimeType: androidClipMimeType,
          ) ??
          'Null response';
    } on PlatformException {
      clipboardValue = 'Failed to get clipboard data';
    }

    print("clip:: $clipboardValue");
    // if (!mounted) return;
    //
    // setState(() {
    //   _lastValue = clipboardValue;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: Stack(
          children: [
            fillDetails(),
            // MediaQuery.of(context).viewInsets.bottom != 0
            //     ? AnimatedPositioned(
            //         bottom: MediaQuery.of(context).viewInsets.bottom,
            //         left: 0,
            //         right: 0,
            //         duration: const Duration(milliseconds: 100),
            //         child: Container(
            //           padding: const EdgeInsets.only(right: 10),
            //           decoration: const BoxDecoration(
            //               border: Border(
            //                 bottom: BorderSide(color: Colors.black12, width: 1),
            //               ),
            //               color: Colors.white),
            //           height: 50,
            //           child: Align(
            //             alignment: Alignment.centerRight,
            //             child: IconButton(
            //               icon: const Icon(Icons.keyboard_hide_outlined,
            //                   size: 25),
            //               onPressed: () =>
            //                   FocusManager.instance.primaryFocus?.unfocus(),
            //             ),
            //           ),
            //         ),
            //       )
            //     : const SizedBox.shrink(),
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
          onPressed: () {
            if (controller.validateDeliveryRoom()) {
              Get.toNamed(Routes.WRITING_MENU);
            } else {
              GetSnackbar.on("입력 에러", "등록 정보를 모두 채워주세요!");
            }
          },
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: controller.content,
                  // controller: controller.deliveryRoomContent,
                  textInputAction: TextInputAction.next,
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "글 제목",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                const Divider(height: dividerHeight),
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
                const Divider(height: dividerHeight),
                Column(
                  children: [
                    const Text("예상 배달비"),
                    NumberPicker(
                      value: controller.deliveryTip.value,
                      minValue: 0,
                      maxValue: 10000,
                      step: 500,
                      axis: Axis.horizontal,
                      decoration: deliveryTipBox,
                      selectedTextStyle: deliveryTipStyle,
                      onChanged: (value) => controller.setDeliveryTip(value),
                    ),
                  ],
                ),
                const Divider(height: dividerHeight),
                storeInfo(),
                const Divider(height: dividerHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "집결지 : ${controller.receivingLocationDescription.value}"),
                    OutlinedButton(
                      onPressed: () =>
                          Get.toNamed(Routes.PICK_RECEIVING_LOCATION),
                      child: const Text("설정"),
                    )
                  ],
                ),
                const Divider(height: dividerHeight),
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
      ),
    );
  }

  Widget storeInfo() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              denseTextField(controller.storeName, "가게이름"),
              denseTextField(controller.deliveryAppTypeOfStoreLink, "배달 어플"),
              // denseTextField(controller.storeLink, "링크"),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () async {
            ClipboardData? data = await Clipboard.getData('text/plain');

            controller.parsingStoreLink(data);
          },
          child: const Text("붙여넣기"),
        ),
      ],
    );
  }

  Widget denseTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        isDense: true,
      ),
      style: Get.width < 400 ? TextStyle(fontSize: 14) : null,
    );
  }

  Widget toggleBtnText(String content) {
    return Text(
      content,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
    );
  }
}
