import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/report/report_controller.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class Report extends GetView<ReportController> {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "유저 신고",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.createReport(); // TODO:신고 내역 넘겨주기
            },
            child: Text("완료"),
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: appBarAction,
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Material(
              type: MaterialType.transparency,
              child: _buildMenu(),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        _buildMenuTitle("신고하는 이유를 선택해주세요."),
        _buildMenuListTile("돈을 안냈어요.", () => print('hello4'), 0),
        _buildMenuListTile("방장이 주문을 안했어요.", () => print('hello4'), 1),
        _buildMenuListTile("방장이 주문을 안했어요.", () => print('hello4'), 2),
        _buildMenuListTile("방장이 주문을 안했어요.", () => print('hello4'), 3),
      ],
    );
  }

  Widget _buildMenuTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        hoverColor: Colors.orangeAccent,
        selectedTileColor: Colors.orangeAccent,
        title: Text(
          title,
          style: appSettingListTileMenuStyle,
        ),
      ),
    );
  }

  Widget _buildMenuListTile(String title, VoidCallback onTapCB, int index) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          onTap: () {
            controller.selectedIndex.value = index;
          },
          selected: index == controller.selectedIndex.value,
          selectedTileColor: Colors.orange[400],
          selectedColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
