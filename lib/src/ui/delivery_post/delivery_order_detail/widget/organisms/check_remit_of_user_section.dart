import 'package:flutter/material.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_order_detail/widget/molecules/check_remit_of_user.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/ui/widgets/toss_withdraw_button.dart';

class CheckRemitOfUserSection extends StatelessWidget {
  const CheckRemitOfUserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "입금 받아야 할 금액",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white70,
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: if 주도자 아닌 경우, 주도자 계좌번호 은행 송금 링크 뜨도록
                  _buildLeaderAccountInfo(),
                  CheckRemitOfUser(),
                  CheckRemitOfUser(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderAccountInfo() {
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
                    "주도자 계좌 정보",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("농협 은행", style: menuTextStyle),
                      Text(
                        "35212545454",
                        style: menuTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TossWithdrawButton(
              bank: "농협", account: "3521264915483", amount: 10000),
        ],
      ),
    );
  }
}
