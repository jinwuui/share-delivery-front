import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/user_menu.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/order_detail.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

// TODO: user order controller
class UserOrderList extends StatelessWidget {
  const UserOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserMenu> orderList = [];

    // OrderFormRegisterController.to.orders.forEach((element) {
    //   element.forEach((key, value) => orderList.add(UserMenu(
    //       elementName: key,
    //       money: value.toString(),
    //       axisAlignment: MainAxisAlignment.start,
    //       textStyle: menuTextStyle)));
    // });

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: DeliveryRecruitController.to.orderMenuList
            .map((element) => OrderDetail(userWithOrderModel: element))
            .toList(),
      ),
    );
  }
}
