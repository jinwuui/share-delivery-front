import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_payment_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/remittance_res_dto.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/payment_menu.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';

class CheckRemitOfUser extends StatelessWidget {
  final RemittanceResDTO remittance;
  const CheckRemitOfUser({Key? key, required this.remittance})
      : super(key: key);

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
                    "${remittance.nickname}" " 님",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaymentMenu(
                      elementName: "",
                      money: remittance.amount,
                      axisAlignment: MainAxisAlignment.start,
                      textStyle: paymentTextStyle,
                    ),
                    _buildRemittanceButton()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemittanceButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          elevation: 0.0,
        ),
        onPressed: remittance.isRemitted == true
            ? null
            : () async {
                await DeliveryPaymentDetailController.to
                    .checkRemittance(remittance.remittanceId);
              },
        child: remittance.isRemitted
            ? Text(
                "송금 완료",
                style: TextStyle(fontSize: 12),
              )
            : Text(
                "송금 확인",
                style: TextStyle(fontSize: 12),
              ),
      ),
    );
  }
}
