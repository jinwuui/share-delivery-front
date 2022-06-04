import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class PostUpdate extends GetView<PostDetailController> {
  const PostUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
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
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      title: const Text("글 수정하기", style: appBarTitle),
      actions: [
        TextButton(
          onPressed: true /*controller.isContentEmpty.value*/
              ? null
              : () {
                  print("sdf");
                },
          child: Text("완료"),
          style: TextButton.styleFrom(
            primary: Colors.black,
            textStyle: appBarAction,
          ),
        ),
      ],
    );
  }
}
