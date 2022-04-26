import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';

class CheckPaymentOfUser extends StatelessWidget {
  const CheckPaymentOfUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text("복동이"),
              ElementWithMoney(
                elementName: '황금올리브 치킨',
                money: '14000',
                axisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: () {},
          child: Text("송금 확인 완료"),
        )
      ],
    );
  }
}
