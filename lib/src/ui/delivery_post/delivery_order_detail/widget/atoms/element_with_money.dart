import 'package:flutter/material.dart';
import 'package:share_delivery/src/util/create_number_with_comma.dart';

class ElementWithMoney extends StatelessWidget {
  const ElementWithMoney({
    Key? key,
    required this.elementName,
    required this.money,
    required this.axisAlignment,
    required this.textStyle,
  }) : super(key: key);

  final String elementName;
  final String money;
  final MainAxisAlignment axisAlignment;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(elementName + " ", style: textStyle),
          Text(
            numberWithComma(int.parse(money)) + "원",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
