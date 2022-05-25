import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/ui/widgets/profile_textform.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountManage extends StatelessWidget {
  AccountManage({Key? key}) : super(key: key);

  final accountManageFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "계좌 정보 입력",
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
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
              elevation: 0.0,
            ),
            onPressed: () {
              if (accountManageFormKey.currentState!.validate()) {
                // validation 이 성공하면 true 가 리턴돼요!
                Get.snackbar(
                  '계좌 정보 저장 완료',
                  '계좌 정보가 변경되었습니다.',
                  backgroundColor: Colors.white,
                );
              }
            },
            child: Text(
              "완료",
              style: TextStyle(
                // color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: accountManageFormKey,
              child: Column(
                children: [
                  ProfileTextFormField(
                    label: "이름",
                    onSaved: (newValue) {},
                    validator: (value) {
                      if (value.length < 1) {
                        return '이름은 필수사항입니다.';
                      }

                      if (value.length < 2) {
                        return '이름은 두글자 이상 입력 해주셔야합니다.';
                      }

                      return null;
                    },
                    initialValue: "박진우", //TODO:
                  ),
                  ProfileTextFormField(
                    label: "계좌번호",
                    onSaved: (newValue) {},
                    validator: (value) {
                      if (value.length > 10 && value.length < 15) {
                        return '이름은 두글자 이상 입력 해주셔야합니다.';
                      }

                      return null;
                    },
                    initialValue: '35212633521264', //TODO:
                  ),
                  // TODO: 은행 선택 빠른매칭 참고하기
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                Get.toNamed('/selectBank');
              },
              child: Text(
                "은행 선택",
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () async {
                // TODO: 사용자 계좌 정보로 교체
                final url = Uri.parse(
                    "supertoss://send?amount=0&bank=NH농협&accountNo=3521264915483&origin=qr");
                if (await canLaunchUrl(url)) {
                  launchUrl(
                    url,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                }
                // supertoss://send?amount=0&bank=대구은행&accountNo=77802467094&origin=qr
              },
              child: Text(
                "Test button",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
