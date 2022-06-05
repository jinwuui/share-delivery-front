import 'package:flutter/material.dart';
import 'package:share_delivery/src/utils/create_number_with_comma.dart';

class ElementWithMoney extends StatelessWidget {
  ElementWithMoney({
    Key? key,
    required this.elementName,
    required this.money,
    required this.axisAlignment,
    required this.textStyle,
    this.quantity,
  }) : super(key: key);

  final String elementName;
  final String money;
  int? quantity;
  final MainAxisAlignment axisAlignment;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: axisAlignment,
        children: [
          Text(elementName + " ", style: textStyle),
          Text(
            numberWithComma(int.parse(money)) + "원",
            style: textStyle,
          ),
          quantity != null
              ? Text(" x " + quantity.toString())
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
