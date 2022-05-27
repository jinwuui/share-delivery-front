import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  static const double padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0 ? categoryTab() : post();
          },
        ),
      ),
      floatingActionButton: fab(),
    );
  }

  Widget categoryTab() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryOption(),
          const SizedBox(width: padding),
          category("동네질문"),
          const SizedBox(width: padding),
          category("동네맛집"),
          const SizedBox(width: padding),
          category("동네소식"),
          const SizedBox(width: padding),
          category("취미생활"),
          const SizedBox(width: padding),
          category("분실/실종"),
          const SizedBox(width: padding),
          category("품앗이"),
        ],
      ),
    );
  }

  Widget post() {
    return Container(
      decoration: bottomBorderBox,
      margin: const EdgeInsets.only(bottom: 7),
      height: 180,
      child: Column(
        children: [
          postInfo(),
          postAction(),
        ],
      ),
    );
  }

  Widget postInfo() {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // TODO : POST_DETAIL 로 넘어갈 때, 게시글을 특정할 수 있는 정보(id...)가 필요함
          Get.toNamed(
            Routes.POST_DETAIL,
            arguments: {"postId": 14},
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eachPostCategory("동네질문"),
                  Text(
                    "안녕하세요 저는 박찬호 입니다. 호투를 하며 제 전성기 시절을 떠올리게하는 LA 다저스 시절이 가장 먼저 생각나기도 하고, 경기가 끝나면 나긋하게 ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: postContentStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("네고왕", style: postDetailStyle),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 3,
                          color: Colors.grey,
                        ),
                      ),
                      Text("매너 온도", style: postDetailStyle),
                    ],
                  ),
                  Text("7분전", style: postDetailStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget postAction() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 0.9),
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          action("공감하기", Icons.add_reaction_outlined, null),
          SizedBox(width: 20),
          action(
            "답변하기",
            Icons.mode_comment_outlined,
            () => Get.toNamed(Routes.POST_DETAIL),
          ),
        ],
      ),
    );
  }

  Widget categoryOption() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.tune_rounded,
          size: 20,
        ),
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget category(String content) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(content),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        elevation: 0,
        primary: Colors.white,
        onPrimary: Colors.grey.shade700,
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  Widget action(String content, IconData icon, var func) {
    return GestureDetector(
      onTap: func,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey.shade600,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(content, style: postActionStyle),
          ),
        ],
      ),
    );
  }

  // Widget dropAction(String content, IconData icon, var func) {
  //   return DropdownButton<Icon>(
  //     value: controller.drop,
  //     onChanged: () {},
  //     items: <Icon>[],
  //
  //   );
  // }

  Widget eachPostCategory(String category) {
    return Container(
      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Text(
        category,
        style:
            TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      shape: const Border(
        bottom: BorderSide(
          color: Colors.black26,
          width: 0.5,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      // titleSpacing: 0.0,
    );
  }

  Widget fab() {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: () => Get.toNamed(Routes.POST_REGISTER),
      child: const Icon(Icons.edit, size: 30),
    );
  }
}
