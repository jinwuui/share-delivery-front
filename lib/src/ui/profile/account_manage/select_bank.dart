import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class SelectBank extends StatelessWidget {
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
        elevation: 0.0,
      ),
      body: selectBankCategory(),
    );
  }

  Widget selectBankCategory() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
      child: GridView.builder(
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

    return GestureDetector(
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: Text(
            _storeCategory,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
