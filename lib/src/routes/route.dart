import 'package:get/get.dart';
import 'package:share_delivery/src/bindings/delivery_history/delivery_history_binding.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/delivery_post/expanded_image_page.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_room_detail.dart';
// import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list_on_map.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/pick_place_on_map.dart';
import 'package:share_delivery/src/ui/home/setting_gathering_place.dart';

abstract class Routes {
  static const INITIAL = "/";
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  static const DELIVERY_ROOM_LIST_ON_MAP = "/deliveryRoomOnMap";
  static const PICK_GATHERING_PLACE = "/pickGatheringPlace";
  static const PICK_PLACE_ON_MAP = "/pickPlaceOnMap";
  static const DELIVERY_HISTORY_DETAIL = "/deliveryHistoryDetail";
  static const EXPANDED_IMAGE_PAGE = "/exapndedImagePage";
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const Root(),
    ),
    // GetPage(
    //   name: Routes.DELIVERY_ROOM_DETAIL,
    //   page: () => const DeliveryRoomDetail(),
    // ),
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
    GetPage(
      name: Routes.DELIVERY_HISTORY_DETAIL,
      page: () => const DeliveryRoomDetail(),
    ),
    GetPage(
      name: Routes.EXPANDED_IMAGE_PAGE,
      page: () => const ExpandedImagePage(),
    ),
  ];
}
