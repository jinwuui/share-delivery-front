import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => GestureDetector(
              onTap: () {
                Get.toNamed('/detailPage');
              },
              child: deliveryRoom(),
            ),
          ),
        ),
      ),
    );
  }

  Widget deliveryRoom() {
    return Column(
      children: [
        Container(
          height: 120,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade200),
        ),
        Divider(
            endIndent: 20,
            indent: 20,
            color: Colors.grey.shade400,
            thickness: 1.5),
      ],
    );
  }
}
