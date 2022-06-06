import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/evaluate_and_report/evaluate_and_report_controller.dart';
import 'package:share_delivery/src/ui/theme/container_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class ReportUser extends GetView<EvaluateAndReportController> {
  const ReportUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: appBar(),
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: userList(),
            ),
            controller.alreadyReportingDone.value
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black26,
                  )
                : SizedBox.shrink(),
          ],
        ),
        bottomSheet: actionBottomSheet(),
      ),
    );
  }

  Widget userList() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => eachUser(index),
    );
  }

  Widget eachUser(int i) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: bottomBorderBox,
      margin: const EdgeInsets.only(bottom: 7),
      // color: Colors.white,
      height: 190,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.grey),
                    SizedBox(width: 10),
                    Text("닉네임", style: postTitleStyle),
                  ],
                ),
                Row(
                  children: [
                    Text("매너온도", style: postDetailStyle),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.fiber_manual_record,
                        size: 3,
                        color: Colors.grey,
                      ),
                    ),
                    Text("36.4", style: postDetailStyle),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 0, thickness: 1),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                evaluationCriteria(
                  "시간 약속을\n안 지켜요",
                  Icon(Icons.directions_run_rounded, size: 50),
                ),
                VerticalDivider(width: 0, thickness: 1),
                evaluationCriteria(
                  "불친절해요",
                  Icon(Icons.sentiment_dissatisfied_rounded, size: 50),
                ),
                VerticalDivider(width: 0, thickness: 1),
                evaluationCriteria(
                  "연락이 안돼요",
                  Icon(Icons.question_mark_rounded, size: 50),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget evaluationCriteria(String content, Icon icon) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("유저 신고 - $content");
          controller.reportUser(123, content);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: icon),
            Expanded(
              child: Center(
                child: Text(
                  content,
                  style: postTitleStyle,
                ),
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
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      title: Text("비매너 신고", style: appBarTitle),
    );
  }

  Widget actionBottomSheet() {
    return Container(
      color: Colors.white,
      height: 60,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                color: Colors.grey.shade600,
                child: Center(
                  child: Text("취소", style: ratingActionBtn),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: controller.alreadyReportingDone.value
                  ? null
                  : () {
                      print("신고 제출하기");
                    },
              child: Container(
                color: controller.alreadyReportingDone.value
                    ? Colors.grey
                    : Colors.red,
                child: Center(
                  child: Text("신고하기", style: ratingActionBtn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
