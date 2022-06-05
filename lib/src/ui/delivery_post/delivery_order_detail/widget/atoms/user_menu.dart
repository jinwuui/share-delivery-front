import 'package:flutter/material.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/utils/create_number_with_comma.dart';

class UserMenu extends StatelessWidget {
  UserMenu({
    Key? key,
    required this.axisAlignment,
    required this.textStyle,
    required this.menuModel,
  }) : super(key: key);

  final MainAxisAlignment axisAlignment;
  final TextStyle textStyle;
  final Menu menuModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: axisAlignment,
            children: [
              Text(menuModel.menuName + " ", style: textStyle),
              Text(
                numberWithComma(menuModel.price) + "원",
                style: textStyle,
              ),
              Text(" x " + menuModel.quantity.toString()),
            ],
          ),
          Column(
            children: _buildOptionMenu(),
          )
        ],
      ),
    );
  }

  List<Widget> _buildOptionMenu() {
    List<Widget> optionMenuList = menuModel.optionMenus.map((e) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(e.menuName + " ", style: TextStyle(fontSize: 12)),
            Text(
              numberWithComma(e.price) + "원",
              style: TextStyle(fontSize: 12),
            ),
            Text(" x " + e.quantity.toString(), style: TextStyle(fontSize: 12)),
          ],
        ),
      );
    }).toList();
    return optionMenuList;
  }
}
