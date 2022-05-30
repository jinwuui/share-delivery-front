import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/account_bank/account_bank_controller.dart';

const List<String> bankCategories = [
  "카카오뱅크",
  "농협",
  "국민",
  "신한",
  "우리",
  "기업",
  "하나",
  "새마을금고",
  "우체국",
  "SC제일",
  "대구",
  "부산",
  "경남",
  "광주",
  "신협",
  "수협",
  "산업",
  "전북",
  "제주",
  "씨티",
  "케이뱅크",
];

class SelectBank extends GetView<AccountBankController> {
  const SelectBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "은행 선택",
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
        actions: [
          TextButton(
            onPressed: () {
              controller.bank.value =
                  bankCategories[controller.pickedBank.value];

              Get.back();
              Get.snackbar("은행 선택 완료", controller.bank.value,
                  duration: Duration(milliseconds: 1000));
            },
            child: Text(
              "완료",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white,
              width: double.infinity,
              child: Center(
                child: Text(
                  "본인 명의의 계좌만 등록 가능합니다.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            selectBankCategory(),
          ],
        ),
      ),
    );
  }

  Widget selectBankCategory() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bankCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return category(index);
        },
      ),
    );
  }

  Widget category(int index) {
    String _storeCategory = bankCategories[index];

    return Obx(
      () => GestureDetector(
        onTap: () => controller.setPickedBank(index),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: index == controller.pickedBank.value
                ? Colors.orangeAccent
                : Colors.grey.shade300,
          ),
          child: Center(
            child: Text(
              _storeCategory,
              style: TextStyle(
                color: index == controller.pickedBank.value
                    ? Colors.white
                    : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
