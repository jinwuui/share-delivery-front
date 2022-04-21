import 'package:get/get.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list_on_map.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/pick_place_on_map.dart';
import 'package:share_delivery/src/ui/home/pick_receiving_location.dart';
import 'package:share_delivery/src/ui/login/init_user_location.dart';
import 'package:share_delivery/src/ui/login/phone_number_authentication.dart';

abstract class Routes {
  static const INITIAL = "/";

  // 모집글 상세정보
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  // 모집글 등록
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  // 모집글 지도로 조회
  static const DELIVERY_ROOM_LIST_ON_MAP = "/deliveryRoomListOnMap";
  // 집결지 선택
  static const PICK_RECEIVING_LOCATION = "/pickReceivingLocation";
  static const PICK_PLACE_ON_MAP = "/pickPlaceOnMap";

  // 로그인
  static const INIT_USER_LOCATION = "/initUserLocation";
  static const PHONE_NUMBER_AUTHENTICATION = "/phoneNumberAuthentication";
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
      name: Routes.PICK_RECEIVING_LOCATION,
      page: () => const PickReceivingLocation(),
    ),
    GetPage(
      name: Routes.PICK_PLACE_ON_MAP,
      page: () => const PickPlaceOnMap(),
    ),
    GetPage(
      name: Routes.INIT_USER_LOCATION,
      page: () => const InitUserLocation(),
    ),
    GetPage(
      name: Routes.PHONE_NUMBER_AUTHENTICATION,
      page: () => const PhoneNumberAuthentication(),
    ),
  ];
}
