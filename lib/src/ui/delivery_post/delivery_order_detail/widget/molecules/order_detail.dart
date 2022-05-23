import 'package:flutter/material.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/user_with_date.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/utils/datetime_to_minute.dart';

class OrderDetail extends StatelessWidget {
  final UserWithOrderModel userWithOrderModel;

  const OrderDetail({Key? key, required this.userWithOrderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.person),
              ),
              UserWithDate(
                user: userWithOrderModel.nickname + " 님",
                date: TimeUtil.timeAgo(userWithOrderModel.orderDate.toLocal()),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: _buildDiscountWidget(),
        )
      ],
    );
  }

  Widget _buildDiscountWidget() {
    List<ElementWithMoney> discountList = [];

    userWithOrderModel.menuList.forEach((key, value) {
      discountList.add(
        ElementWithMoney(
          elementName: key,
          money: value.toString(),
          axisAlignment: MainAxisAlignment.start,
          textStyle: paymentTextStyle,
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: discountList,
    );
  }
}
