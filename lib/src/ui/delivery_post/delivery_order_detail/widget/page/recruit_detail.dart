import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/payment_of_order.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/organisms/user_order.dart';

//TODO: user order getx controller 만들기

class DeliveryRecruitDetail extends GetView<DeliveryRecruitController> {
  const DeliveryRecruitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (userWithOrderList) => Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                ...userWithOrderList!
                    .map((e) => UserOrder(
                          userWithOrderModel: e,
                        ))
                    .toList(),
                _buildAmountOfOrder(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildCheckComplitedButton(),
      ),
      onLoading: Center(child: CircularProgressIndicator()),
      onError: (error) {
        return Center(
          child: Text(
            'Error: $error',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Widget _buildAmountOfOrder() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: PaymentOfOrder(),
    );
  }

  Widget _buildCheckComplitedButton() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          Get.snackbar(
            "주문 진행 확인",
            "주문 상세 정보 입력 페이지로 이동",
            backgroundColor: Colors.white,
            duration: Duration(
              seconds: 1,
            ),
          );
          DeliveryRecruitController.to.completeRecurit();
          DeliveryOrderController.to
              .changeStatus(DeliveryOrderStatus.recuritmentCompleted);
        },
        child: Text("주문 진행 확인"),
      ),
    );
  }
}
