import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/custom_text_form_field.dart';

class RegisterDiscountInfo extends StatefulWidget {
  RegisterDiscountInfo({Key? key}) : super(key: key);

  @override
  State<RegisterDiscountInfo> createState() => _RegisterDiscountInfoState();
}

class _RegisterDiscountInfoState extends State<RegisterDiscountInfo> {
  final formKey = GlobalKey<FormState>();

  String menu = "";
  String amount = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formKey,
          child: Container(
            // margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  label: '할인 정보',
                  onSaved: (val) {
                    setState(() {
                      menu = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '할인 정보는 필수사항입니다.';
                    }

                    return null;
                  },
                ),
                CustomTextFormField(
                  label: '금액',
                  onSaved: (val) {
                    setState(() {
                      amount = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '금액은 필수사항입니다.';
                    }
                    if (int.tryParse(val) == null) {
                      return "금액은 숫자로 입력해주세요.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // validation 이 성공하면 폼 저장하기
                        formKey.currentState!.save();

                        Get.find<OrderFormRegisterController>()
                            .addDiscountItem(menu, amount);

                        Get.back();

                        Get.snackbar(
                          '저장완료!',
                          '할인 정보 저장이 완료되었습니다!',
                          backgroundColor: Colors.white,
                        );
                      }
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
