import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickReceivingLocation extends StatefulWidget {
  const PickReceivingLocation({Key? key}) : super(key: key);

  @override
  State<PickReceivingLocation> createState() => _PickReceivingLocationState();
}

class _PickReceivingLocationState extends State<PickReceivingLocation> {
  late Widget _myAnimatedWidget;

  @override
  void initState() {
    _myAnimatedWidget = page1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: Get.height * 0.9,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _myAnimatedWidget,
      ),
    );
  }

  Widget page1() {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.back(),
          child: SizedBox(
            width: double.infinity,
            child: Icon(Icons.horizontal_rule, size: 40),
          ),
        ),
        placeSettingBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                20,
                (index) => locationRecord(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget page2() {
    return Column(
      children: [Icon(Icons.arrow_back)],
    );
  }

  Widget placeSettingBar() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // TODO: AnimatedSwitcher 사용해서 bottom sheet 내에서 위젯 변경할 것!
        setState(() {
          _myAnimatedWidget = page2();
        });
        print("지도로 설정 터치 체크");
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.grey.shade200,
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(Icons.gps_fixed_rounded),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("지도로 설정"),
              )
            ]),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget locationRecord() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("이전 위치 텍스트 터치 체크");
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.place_outlined),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("이전 위치 텍스트"),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            indent: 50,
          ),
        ],
      ),
    );
  }
}
