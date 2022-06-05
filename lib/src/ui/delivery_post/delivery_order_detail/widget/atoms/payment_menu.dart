import 'package:flutter/material.dart';
import 'package:share_delivery/src/utils/create_number_with_comma.dart';

class PaymentMenu extends StatelessWidget {
  PaymentMenu({
    Key? key,
    required this.elementName,
    required this.money,
    required this.axisAlignment,
    required this.textStyle,
    this.quantity,
  }) : super(key: key);

  final String elementName;
  final int money;
  int? quantity;
  final MainAxisAlignment axisAlignment;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: axisAlignment,
            children: [
              Text(elementName + " ", style: textStyle),
              Text(
                numberWithComma(money) + "원",
                style: textStyle,
              ),
              // Text(" x " + menuModel.quantity.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
