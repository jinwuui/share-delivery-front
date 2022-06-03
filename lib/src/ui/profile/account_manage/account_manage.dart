import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/profile/account_bank/account_bank_controller.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';
import 'package:share_delivery/src/ui/widgets/profile_textform.dart';

class AccountManage extends GetView<AccountBankController> {
  AccountManage({Key? key}) : super(key: key);

  final accountManageFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "계좌 정보 입력",
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
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                elevation: 0.0,
              ),
              onPressed: () {
                if (accountManageFormKey.currentState!.validate()) {
                  // validation 이 성공하면 true
                  controller.updateAccountBank();

                  Get.back();

                  Get.snackbar(
                    '계좌 정보 저장 완료',
                    '계좌 정보가 변경되었습니다.',
                    backgroundColor: Colors.white,
                  );
                }
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
        ),
        body: Obx(
          (() => controller.isLoad == true
              ? Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: accountManageFormKey,
                        child: Column(
                          children: [
                            ProfileTextFormField(
                              label: "이름",
                              onSaved: (newValue) {},
                              validator: (value) {
                                if (value.length < 1) {
                                  return '이름은 필수사항입니다.';
                                }

                                if (value.length < 2) {
                                  return '이름은 두글자 이상 입력 해주셔야합니다.';
                                }

                                return null;
                              },
                              initialValue:
                                  controller.accountHolder.value, //TODO:
                            ),
                            _buildAccountTextField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: SpinKitThreeBounce(
                    size: 25,
                    color: Colors.black,
                  ),
                )),
        ));
  }

  Widget _buildAccountTextField() {
    String label = "계좌번호";

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: profileTextStyle),
            TextButton(
              onPressed: () async {
                var value = await Get.toNamed('/selectBank');

                if (value != null) {
                  Logger().d(value);
                }
              },
              child: Text(
                "은행 선택",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          child: TextFormField(
            onSaved: (newValue) {},
            validator: (value) {
              if (value!.isEmpty) {
                return '계좌번호는 필수사항입니다.';
              }

              if (controller.bank.value == "") {
                return '은행정보는 필수사항입니다.';
              }

              return null;
            },
            initialValue: controller.accountNumber.value,
            decoration: InputDecoration(
              prefix: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.all(8.0),
                color: Colors.orangeAccent,
                child: Obx(
                  () => Text(
                    controller.bank.value == "" ? "없음" : controller.bank.value,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.orangeAccent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
