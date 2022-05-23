import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "설정",
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
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildEtcMenu(),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildEtcMenu() {
    return Column(
      children: [
        _buildMenuTitle("기타"),
        _buildMenuListTile("로그아웃", () => print('hello4')),
        _buildMenuListTile("버전 1.0.0", () => print('hello4')),
        _buildMenuListTile("오픈소스 라이선스", () => print('hello4')),
        _buildMenuListTile("회원탈퇴", () => print('hello4')),
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

  Widget _buildMenuListTile(String title, VoidCallback onTapCB) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        child: ListTile(
          hoverColor: Colors.orange,
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
