import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/user_order_detail.dart';

// recruit detail
class UserOrder extends StatelessWidget {
  const UserOrder({Key? key, required this.orderMenuModel}) : super(key: key);
  final OrderMenuModel orderMenuModel;

  @override
  Widget build(BuildContext context) {
    int leaderId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.leader.accountId;
    User user = AuthenticationController.to.state.props.first as User;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: UserOrderDetail(orderMenuModel: orderMenuModel),
          ),
          user.accountId == leaderId && orderMenuModel.accountId != leaderId
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0.0,
                    side: BorderSide(width: 1.0, color: Colors.grey.shade300),
                  ),
                  onPressed: () async {
                    await DeliveryRecruitController.to
                        .deleteUserWithOrder(orderMenuModel.accountId);
                  },
                  child: Text(
                    "거절",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
