import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/order_detail.dart';

class UserOrder extends StatelessWidget {
  const UserOrder({Key? key, required this.userWithOrderModel})
      : super(key: key);
  final UserWithOrderModel userWithOrderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: OrderDetail(userWithOrderModel: userWithOrderModel)),
          userWithOrderModel.userId != "park"
              ? Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0.0,
                          side: BorderSide(
                              width: 1.0, color: Colors.grey.shade300),
                        ),
                        onPressed: () {
                          Get.snackbar("주문 취소", "다른 사용자의 주문을 취소하였습니다.");

                          DeliveryRecruitController.to
                              .deleteUserWithOrder(userWithOrderModel.userId);
                        },
                        child: Text(
                          "취소",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
