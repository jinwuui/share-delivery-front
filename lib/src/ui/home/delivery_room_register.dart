import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/ui/home/pick_receiving_location.dart';

class DeliveryRoomRegister extends StatefulWidget {
  const DeliveryRoomRegister({Key? key}) : super(key: key);

  @override
  State<DeliveryRoomRegister> createState() => _DeliveryRoomRegisterState();
}

class _DeliveryRoomRegisterState extends State<DeliveryRoomRegister> {
  final List<bool> _numOfPeopleSelections = [true, false, false];
  final List<bool> _limitTimeSelections = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: TextButton(
            onPressed: () => Get.back(),
            child: const Text("닫기", style: TextStyle(color: Colors.black)),
          ),
          title: const Text(
            "배달 모집글 등록",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: 모집글 등록 로직 필요
                print("완료 - 모집글 등록 로직 필요");
                Get.back();
              },
              child: const Text("완료", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        body: Stack(
          children: [
            fillDetails(),
            MediaQuery.of(context).viewInsets.bottom != 0
                ? AnimatedPositioned(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 0,
                    right: 0,
                    duration: Duration(milliseconds: 100),
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1)),
                          color: Colors.white),
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.keyboard_hide_outlined, size: 25),
                          onPressed: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget fillDetails() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TextField(
              textInputAction: TextInputAction.next,
              maxLength: 30,
              decoration: InputDecoration(
                hintText: "글 제목",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            Divider(height: 0),
            Row(
              children: [
                Expanded(
                  child: const TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "배달 가게 링크",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    ClipboardData? data =
                        await Clipboard.getData(Clipboard.kTextPlain);
                    if (data == null) {
                      print("< null >");
                    } else {
                      print(data.text);
                    }
                  },
                  child: const Text("클립보드 복사"),
                ),
              ],
            ),
            Divider(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("참여 인원"),
                ToggleButtons(
                  color: Colors.grey,
                  fillColor: Colors.orange,
                  selectedColor: Colors.white,
                  children: [
                    toggleBtnText("2"),
                    toggleBtnText("3"),
                    toggleBtnText("4")
                  ],
                  isSelected: _numOfPeopleSelections,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _numOfPeopleSelections.length; i++) {
                        if (i == index) {
                          _numOfPeopleSelections[i] = true;
                        } else {
                          _numOfPeopleSelections[i] = false;
                        }
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("집결지"),
                // TODO : 주소 얻어오는거 가능해지면 주소로 변경할 것
                // Expanded(
                //   child: TextField(
                //     readOnly: true,
                //     decoration: InputDecoration(
                //       hintText: "집결지",
                //       border: InputBorder.none,
                //       focusedBorder: InputBorder.none,
                //     ),
                //   ),
                // ),
                OutlinedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        PickReceivingLocation(),
                        isScrollControlled: true,
                      );
                    },
                    child: Text("설정"))
              ],
            ),
            Divider(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("마감 시간"),
                ToggleButtons(
                  color: Colors.grey,
                  fillColor: Colors.orange,
                  selectedColor: Colors.white,
                  children: [
                    toggleBtnText("5분"),
                    toggleBtnText("10분"),
                    toggleBtnText("20분")
                  ],
                  isSelected: _limitTimeSelections,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _limitTimeSelections.length; i++) {
                        if (i == index) {
                          _limitTimeSelections[i] = true;
                        } else {
                          _limitTimeSelections[i] = false;
                        }
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget toggleBtnText(String content) {
    return Text(
      content,
      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
    );
  }
}
