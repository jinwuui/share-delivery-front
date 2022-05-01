import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedImagePage extends StatelessWidget {
  const ExpandedImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "주문서 확인",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(Get.arguments),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
