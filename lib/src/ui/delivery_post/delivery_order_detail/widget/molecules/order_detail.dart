import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/user_with_date.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(Icons.person),
              UserWithDate(user: "나의 주문 메뉴", date: "5분전"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              ElementWithMoney(
                elementName: 'bbq 황금올리브 치킨',
                money: '21000',
                axisAlignment: MainAxisAlignment.spaceBetween,
                textStyle: menuTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
