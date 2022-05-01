import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElevatedBtn extends StatelessWidget {
  String text;
  var onPressed;

  ElevatedBtn({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // TODO : 휴대폰 번호 입력이 거의 다 되면 (길이로 체크?) 버튼 on 하기
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),

      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        textStyle: const TextStyle(fontSize: 20),
        elevation: 0,
        fixedSize: Size(Get.width * 0.9, Get.height * 0.06),
      ),
      // TODO : 키보드 내릴 것
      onPressed: () => onPressed,
    );
  }
}
