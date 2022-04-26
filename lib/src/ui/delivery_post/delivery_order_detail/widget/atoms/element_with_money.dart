import 'package:flutter/material.dart';

class ElementWithMoney extends StatelessWidget {
  const ElementWithMoney({
    Key? key,
    required this.elementName,
    required this.money,
    required this.axisAlignment,
  }) : super(key: key);

  final String elementName;
  final String money;
  final MainAxisAlignment axisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: axisAlignment,
      children: [
        Text(elementName + " "),
        Text(money),
      ],
    );
  }
}
