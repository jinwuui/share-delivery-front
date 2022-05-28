import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_register/post_register_controller.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class SettingPostCategory extends GetView<PostRegisterController> {
  const SettingPostCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            category(topic1),
            category(topic2),
            category(topic3),
            category(topic4),
            category(topic5),
            category(topic6),
          ],
        ),
      ),
    );
  }

  Widget category(String content) {
    return GestureDetector(
      onTap: () {
        controller.setPostTopic(content);
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 50,
        decoration: bottomBorderBox,
        child: Row(
          children: [
            Text(
              content,
              style: content != controller.category.value
                  ? defaultPostCategory
                  : pickedPostCategory,
            ),
            content != controller.category.value
                ? const SizedBox.shrink()
                : const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.deepOrange,
                      size: 19,
                    ),
                  ),
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
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      title: const Text("주제 선택", style: appBarTitle),
    );
  }

  static const String topic1 = "동네질문";
  static const String topic2 = "동네맛집";
  static const String topic3 = "동네소식";
  static const String topic4 = "취미생활";
  static const String topic5 = "분실/실종";
  static const String topic6 = "품앗이";
}
