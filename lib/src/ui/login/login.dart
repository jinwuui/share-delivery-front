import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/routes/route.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.flutter_dash_outlined,
                      size: 150,
                    ),
                    Text(
                      "당신 근처의 배달 공유\n배달비 절감부터 동네 맛집 공유까지\n지금 내 동네를 선택하고 시작하세요!",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: const Text("시작하기"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(fontSize: 20),
                    elevation: 0,
                    fixedSize: Size(Get.width * 0.9, Get.height * 0.05),
                    shadowColor: Colors.orange,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.PICK_USER_LOCATION,
                        arguments: Routes.PHONE_NUMBER_AUTHENTICATION);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "이미 계정이 있나요? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () =>
                            Get.toNamed(Routes.PHONE_NUMBER_AUTHENTICATION),
                        child: const Text("로그인"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
