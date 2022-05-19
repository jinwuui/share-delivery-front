import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_register/post_register_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// class PostRegister extends StatefulWidget {
//   const PostRegister({Key? key}) : super(key: key);
//
//   @override
//   State<PostRegister> createState() => _PostRegisterState();
// }
//
// class _PostRegisterState extends State<PostRegister> {
//   Alignment alignment = Alignment.bottomCenter;
//   final FocusNode _node = FocusNode();
//
//   final double keyboardHeight =
//       PersistentKeyboardHeight.of(Get.context!).keyboardHeight;
//   static const double bottomSheetHeight = 45;
//   late final double alignY;
//
//   @override
//   void initState() {
//     super.initState();
//
//     alignY = (keyboardHeight + bottomSheetHeight / 2) / Get.height - 0.5;
//
//     _node.addListener(() {
//       setState(() {
//         alignment =
//             _node.hasFocus ? Alignment(0, alignY) : Alignment.bottomCenter;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: appBar(),
//         body: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: 70,
//                 width: double.infinity,
//                 margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
//                 decoration: bottomBorderBox,
//                 child: GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onTap: () {
//                     // TODO : 게시글 주제 설정 페이지로 이동
//                     print('_PostRegisterState.build');
//                     Get.toNamed(Routes.SETTING_POST_CATEGORY);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("글의 주제를 선택해주세요!", style: postRegisterCategory),
//                       Icon(Icons.keyboard_arrow_right),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(color: Colors.blue, child: Divider(height: 0)),
//               TextField(focusNode: _node),
//               // Expanded(
//               //   child: AnimatedAlign(
//               //     alignment: alignment,
//               //     curve: Curves.decelerate,
//               //     // curve: Curves.easeOutQuad,
//               //     duration: const Duration(milliseconds: 200),
//               //     child: bottomSheet(),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         bottomSheet: bottomSheetV2(context),
//       ),
//     );
//   }
//
//   PreferredSizeWidget appBar() {
//     return AppBar(
//       shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
//       elevation: 0,
//       backgroundColor: Colors.white,
//       leading: IconButton(
//         onPressed: () => Get.back(),
//         icon: Icon(
//           Icons.close,
//           color: Colors.black,
//         ),
//       ),
//       title: const Text("생활 공유", style: postRegisterTitle),
//       actions: [
//         TextButton(
//           onPressed: null,
//           child: Text("완료", style: postRegisterDone),
//         ),
//       ],
//     );
//   }
//
//   Widget bottomSheet() {
//     return Container(
//       width: double.infinity,
//       decoration: topBorderBox,
//       child: SizedBox(
//         height: bottomSheetHeight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   child: Row(
//                     children: [
//                       const Icon(Icons.image_outlined),
//                       Text("0 / 10"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   child: Row(
//                     children: [
//                       const Icon(Icons.add_location_alt_outlined),
//                       Text("0 / 1"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             IconButton(
//               onPressed: () => FocusManager.instance.primaryFocus?.unfocus(),
//               icon: const Icon(Icons.keyboard_hide_outlined),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget bottomSheetV2(BuildContext ctx) {
//     return AnimatedPadding(
//       padding: MediaQuery.of(ctx).viewInsets,
//       duration: const Duration(milliseconds: 0),
//       curve: Curves.decelerate,
//       child: Container(
//         width: double.infinity,
//         decoration: topBorderBox,
//         child: SizedBox(
//           height: bottomSheetHeight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const SizedBox(width: 10),
//                   GestureDetector(
//                     child: Row(
//                       children: [
//                         const Icon(Icons.image_outlined),
//                         Text("0 / 10"),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   GestureDetector(
//                     child: Row(
//                       children: [
//                         const Icon(Icons.add_location_alt_outlined),
//                         Text("0 / 1"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () => FocusManager.instance.primaryFocus?.unfocus(),
//                 icon: const Icon(Icons.keyboard_hide_outlined),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PostRegister extends GetView<PostRegisterController> {
  const PostRegister({Key? key}) : super(key: key);

  static const double bottomSheetHeight = 45;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBar(),
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                postTopic(),
                postContent(),
                // Expanded(
                //   child: AnimatedAlign(
                //     alignment: alignment,
                //     curve: Curves.decelerate,
                //     // curve: Curves.easeOutQuad,
                //     duration: const Duration(milliseconds: 200),
                //     child: bottomSheet(),
                //   ),
                // ),
              ],
            ),
          ),
          bottomSheet: bottomSheetV2(context),
        ),
      ),
    );
  }

  Widget postTopic() {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: bottomBorderBox,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Get.toNamed(Routes.SETTING_POST_CATEGORY),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.postTopic.value, style: postCategory),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }

  Widget postContent() {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        controller: controller.postContent.value,
        minLines: 6,
        maxLines: 6,
        onChanged: (text) => controller.setIsContentEmpty(text),
        style: postCategory,
        decoration: InputDecoration(
          hintText: "자유롭게 자신의 생활을 공유해주세요!",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    // print("isnull? ${controller.postContent.text.trim().isEmpty}");

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
      title: const Text("생활 공유", style: postRegisterTitle),
      actions: [
        TextButton(
          onPressed: controller.isContentEmpty.value
              ? null
              : () {
                  print("sdf");
                },
          child: Text("완료"),
          style: TextButton.styleFrom(
            primary: Colors.black,
            textStyle: postRegisterDone,
          ),
        ),
      ],
    );
  }

  Widget bottomSheetV2(BuildContext ctx) {
    return AnimatedPadding(
      padding: MediaQuery.of(ctx).viewInsets,
      duration: const Duration(milliseconds: 0),
      curve: Curves.decelerate,
      child: Container(
        width: double.infinity,
        decoration: topBorderBox,
        child: SizedBox(
          height: bottomSheetHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Row(
                      children: [
                        const Icon(Icons.image_outlined),
                        Text("0 / 10"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Row(
                      children: [
                        const Icon(Icons.add_location_alt_outlined),
                        Text("0 / 1"),
                      ],
                    ),
                  ),
                ],
              ),
              MediaQuery.of(ctx).viewInsets.bottom <= 100
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      icon: const Icon(Icons.keyboard_hide_outlined),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
