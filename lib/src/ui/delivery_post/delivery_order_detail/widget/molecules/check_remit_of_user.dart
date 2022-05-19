import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/atoms/element_with_money.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class CheckRemitOfUser extends StatefulWidget {
  const CheckRemitOfUser({Key? key}) : super(key: key);

  @override
  State<CheckRemitOfUser> createState() => _CheckRemitOfUserState();
}

class _CheckRemitOfUserState extends State<CheckRemitOfUser> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "복동이" " 님",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                ElementWithMoney(
                  elementName: '황금올리브 치킨',
                  money: '14000',
                  axisAlignment: MainAxisAlignment.center,
                  textStyle: menuTextStyle,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: check ? Colors.red : Colors.orange,
                elevation: 0.0,
              ),
              onPressed: () {
                setState(() {
                  check = !check;
                });
              },
              child: check
                  ? Text(
                      "송금 완료",
                      style: TextStyle(fontSize: 12),
                    )
                  : Text(
                      "송금 확인",
                      style: TextStyle(fontSize: 12),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
