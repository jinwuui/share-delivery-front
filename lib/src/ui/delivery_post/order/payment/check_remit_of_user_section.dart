import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_payment_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/ui/delivery_post/order/payment/check_remit_of_user.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/ui/widgets/toss_withdraw_button.dart';

class CheckRemitOfUserSection extends GetView<DeliveryPaymentDetailController> {
  const CheckRemitOfUserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (AuthenticationController.to.state.props.first as User).accountId ==
                    DeliveryPaymentDetailController
                        .to.deliveryPaymentDetail.leader.accountId
                ? "입금 받아야 할 금액"
                : "주도자 계좌 정보",
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
                  _buildLeaderAccountInfo(),
                  (AuthenticationController.to.state.props.first as User)
                              .accountId ==
                          DeliveryPaymentDetailController
                              .to.deliveryPaymentDetail.leader.accountId
                      ? Obx(
                          () => Column(
                              children: DeliveryPaymentDetailController
                                  .to.remittances
                                  .map((e) {
                            if (e.accountId ==
                                DeliveryPaymentDetailController.to
                                    .deliveryPaymentDetail.leader.accountId) {
                              return Container();
                            }
                            return CheckRemitOfUser(
                              remittance: e,
                            );
                          }).toList()),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderAccountInfo() {
    String bank = controller.deliveryPaymentDetail.leader.bankAccount.bank;
    String accountHolder =
        controller.deliveryPaymentDetail.leader.bankAccount.accountHolder;
    String accountNumber =
        controller.deliveryPaymentDetail.leader.bankAccount.accountNumber;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
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
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$bank $accountHolder", style: menuTextStyle),
                            SizedBox(height: 5),
                            Text(
                              accountNumber,
                              style: menuTextStyle,
                            ),
                          ],
                        ),
                      ),
                      TossWithdrawButton(
                        bank: bank,
                        account: accountNumber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
