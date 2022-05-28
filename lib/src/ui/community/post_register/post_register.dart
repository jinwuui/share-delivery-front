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
                postCategory(context),
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

  Widget postCategory(BuildContext ctx) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: bottomBorderBox,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          if (MediaQuery.of(ctx).viewInsets.bottom > 50) {
            FocusManager.instance.primaryFocus?.unfocus();
            await 0.2.delay();
          }
          Get.toNamed(Routes.SETTING_POST_CATEGORY);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.category.value, style: defaultPostCategory),
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
        controller: controller.content.value,
        minLines: 6,
        maxLines: 6,
        onChanged: (text) => controller.setIsContentEmpty(text),
        style: defaultPostCategory,
        decoration: InputDecoration(
          hintText: "자유롭게 자신의 생활을 공유해주세요!",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
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
        icon: const Icon(Icons.close, color: Colors.black),
      ),
      title: const Text("생활 공유", style: appBarTitle),
      actions: [
        TextButton(
          onPressed: controller.isContentEmpty.value
              ? null
              : () {
                  print("게시글 등록 로직 필요");
                  controller.registerPost();
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
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      print("사진 등록하기");
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.image_outlined),
                        Text("0 / 10"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      print("장소 등록하기");
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
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
