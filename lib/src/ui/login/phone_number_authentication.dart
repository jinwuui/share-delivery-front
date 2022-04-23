import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login_controller.dart';

class PhoneNumberAuthentication extends StatefulWidget {
  const PhoneNumberAuthentication({Key? key}) : super(key: key);

  @override
  State<PhoneNumberAuthentication> createState() =>
      _PhoneNumberAuthenticationState();
}

class _PhoneNumberAuthenticationState extends State<PhoneNumberAuthentication> {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("휴대폰 번호 인증", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.lock_outlined, size: 100),
                SizedBox(width: 10),
                Expanded(
                  child:
                      Text("저희는 휴대폰 번호로 가입해요.\n번호는 안전하게 보관 되며 어디에도 공개되지 않아요."),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: Get.width * 0.9,
            height: Get.height * 0.07,
            // padding: EdgeInsets.all(50),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15.0),
                hintText: "휴대폰 번호(- 없이 숫자만 입력)",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            // TODO : 휴대폰 번호 입력이 거의 다 되면 (길이로 체크?) 버튼 on 하기
            child: Text("인증문자 받기"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
              elevation: 0,
              fixedSize: Size(Get.width * 0.9, Get.height * 0.06),
            ),
            onPressed: /* _isButtonEnabled ? () {} : null */ () {
              // 로그인 시도 -> 지금은 테스트 단계이므로 바로 로그인 됨
              _controller.login("testid", "testpw");
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "이미 계정이 있나요? ",
                  style: TextStyle(color: Colors.black87),
                ),
                TextButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text("추가 예정입니다."),
                        actions: [
                          TextButton(
                            child: Text("닫기"),
                            onPressed: () => Get.back(),
                          )
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "이메일로 계정 찾기",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
