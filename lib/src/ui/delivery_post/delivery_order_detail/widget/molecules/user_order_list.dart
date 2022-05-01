import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';

class UserOrderList extends StatelessWidget {
  const UserOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElementWithMoney(
              elementName: '황금올리브',
              money: '14000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: '자메이카',
              money: '15000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: '황올순살',
              money: '16000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: '메이플',
              money: '17000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: "총 주문 금액",
              money: '50000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: "배달비",
              money: '4000',
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: "할인",
              money: "3000",
              axisAlignment: MainAxisAlignment.start),
          ElementWithMoney(
              elementName: "총 결제 금액",
              money: "45000",
              axisAlignment: MainAxisAlignment.start),
        ],
      ),
    );
  }
}
