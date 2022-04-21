import 'package:get/get.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list_on_map.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/pick_place_on_map.dart';
import 'package:share_delivery/src/ui/home/setting_gathering_place.dart';

abstract class Routes {
  static const INITIAL = "/";
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  static const DELIVERY_ROOM_LIST_ON_MAP = "/deliveryRoomListOnMap";
  static const PICK_GATHERING_PLACE = "/pickGatheringPlace";
  static const PICK_PLACE_ON_MAP = "/pickPlaceOnMap";
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
    GetPage(
      name: Routes.DELIVERY_ROOM_LIST_ON_MAP,
      page: () => const DeliveryRoomListOnMap(),
    ),
    GetPage(
      name: Routes.PICK_GATHERING_PLACE,
      page: () => const SettingGatheringPlace(),
    ),
    GetPage(
      name: Routes.PICK_PLACE_ON_MAP,
      page: () => const PickPlaceOnMap(),
    ),
  ];
}
