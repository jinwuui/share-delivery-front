import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/register_discount_info.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/payment_of_order.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/user_order_list.dart';

class CheckOrderAndTotalPaymentSection extends StatelessWidget {
  const CheckOrderAndTotalPaymentSection(
      {Key? key, required this.registerDiscountButton})
      : super(key: key);

  final bool registerDiscountButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "주문 내용 확인",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              registerDiscountButton
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0.0,
                        side:
                            BorderSide(width: 1.0, color: Colors.grey.shade300),
                      ),
                      onPressed: () {
                        Get.bottomSheet(
                          RegisterDiscountInfo(),
                        );
                      },
                      child: Text(
                        "할인 정보 등록",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white70,
            ),
            child: Column(
              children: [
                UserOrderList(),
                Divider(
                  thickness: 1.0,
                  height: 20.0,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
                PaymentOfOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
