import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({Key? key}) : super(key: key);

  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  TextEditingController textController = TextEditingController();
  int prevLen = 0;

  void _onChanged(String text) {
    if ((prevLen == 3 && text.length > 3) ||
        (prevLen == 8 && text.length > 8)) {
      addSpace(text);
    }

    if ((prevLen == 5 && text.length < 5) ||
        (prevLen == 10 && text.length < 10)) {
      removeSpace(text);
    }

    prevLen = textController.value.text.length;
  }

  void addSpace(String text) {
    textController.text =
        text.substring(0, text.length - 1) + " " + text[text.length - 1];
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length));
  }

  void removeSpace(String text) {
    textController.text = text.substring(0, text.length - 1);
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: Get.width * 0.9,
      height: Get.height * 0.07,
      child: TextField(
        controller: textController,
        maxLength: 13,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.0),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          counterText: "",
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
