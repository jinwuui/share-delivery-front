import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/order_detail.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// TODO: user order controller
class UserOrderList extends StatelessWidget {
  const UserOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ElementWithMoney> orderList = [];

    OrderFormRegisterController.to.orderList.forEach((element) {
      element.forEach((key, value) => orderList.add(ElementWithMoney(
          elementName: key,
          money: value.toString(),
          axisAlignment: MainAxisAlignment.start,
          textStyle: menuTextStyle)));
    });

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: DeliveryRecruitController.to.userWithOrderList
            .map((element) => OrderDetail(userWithOrderModel: element))
            .toList(),
      ),
    );
  }
}
