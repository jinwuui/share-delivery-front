import 'package:get/get.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';

abstract class Routes {
  static const INITIAL = "/";
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const Root(),
    ),
    GetPage(
      name: Routes.DELIVERY_ROOM_DETAIL,
      page: () => const DeliveryRoomDetail(),
    ),
    GetPage(
      name: Routes.DELIVERY_ROOM_REGISTER,
      page: () => const DeliveryRoomRegister(),
    ),
  ];
}
