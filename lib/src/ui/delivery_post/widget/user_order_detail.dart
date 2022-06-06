import 'package:flutter/material.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/ui/delivery_post/widget/user_menu_with_option.dart';
import 'package:share_delivery/src/ui/theme/text_theme.dart';
import 'package:share_delivery/src/utils/time_util.dart';

class UserOrderDetail extends StatelessWidget {
  final OrderMenuModel orderMenuModel;

  const UserOrderDetail({Key? key, required this.orderMenuModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int leaderId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.leader.accountId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.person),
              ),
              orderMenuModel.accountId == leaderId
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "주도자",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Row(
                children: [
                  Text(
                    orderMenuModel.nickName + " 님",
                  ),
                  SizedBox(
                    height: 10,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Text(TimeUtil.timeAgo(
                      orderMenuModel.createdDateTime.toLocal())),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: _buildMenu(),
        )
      ],
    );
  }

  Widget _buildMenu() {
    List<UserMenuWithOption> menuList = orderMenuModel.menus
        .map(
          (e) => UserMenuWithOption(
            menuModel: e,
            axisAlignment: MainAxisAlignment.start,
            textStyle: paymentTextStyle,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menuList,
    );
  }
}
