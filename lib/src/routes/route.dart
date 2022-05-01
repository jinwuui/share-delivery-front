import 'package:get/get.dart';
import 'package:share_delivery/src/bindings/delivery_room_register/delivery_room_register_binding.dart';
import 'package:share_delivery/src/bindings/login/phone_number_authentication_binding.dart';
import 'package:share_delivery/src/bindings/root_binding.dart';
import 'package:share_delivery/src/bindings/widgets/pick_user_location_binding.dart';
import 'package:share_delivery/src/bindings/delivery_history/delivery_history_binding.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/delivery_room_register.dart';
import 'package:share_delivery/src/ui/login/login.dart';
import 'package:share_delivery/src/ui/login/phone_number_authentication.dart';
import 'package:share_delivery/src/ui/widgets/pick_user_location.dart';
import 'package:share_delivery/src/ui/delivery_post/expanded_image_page.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_room_detail.dart';
// import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_list_on_map.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/pick_place_on_map.dart';
import 'package:share_delivery/src/ui/home/setting_gathering_place.dart';

abstract class Routes {
  // 기본 화면
  static const INITIAL = "/";

  // 모집글 상세정보
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  // 모집글 등록
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  static const DELIVERY_ROOM_LIST_ON_MAP = "/deliveryRoomOnMap";
  static const PICK_GATHERING_PLACE = "/pickGatheringPlace";
  static const PICK_PLACE_ON_MAP = "/pickPlaceOnMap";
  static const DELIVERY_HISTORY_DETAIL = "/deliveryHistoryDetail";
  static const EXPANDED_IMAGE_PAGE = "/exapndedImagePage";
  // 현재 위치 설정
  static const PICK_USER_LOCATION = "/pickUserLocation";

  // 로그인
  static const LOGIN = "/login";
  static const PHONE_NUMBER_AUTHENTICATION = "/phoneNumberAuthentication";
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const Root(),
      binding: RootBinding(),
    ),
    // GetPage(
    //   name: Routes.DELIVERY_ROOM_DETAIL,
    //   page: () => const DeliveryRoomDetail(),
    // ),
    GetPage(
      name: Routes.DELIVERY_ROOM_REGISTER,
      page: () => const DeliveryRoomRegister(),
      binding: DeliveryRoomRegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const Login(),
    ),
    GetPage(
      name: Routes.PICK_USER_LOCATION,
      page: () => const PickUserLocation(),
      binding: PickUserLocationBinding(),
    ),
    GetPage(
      name: Routes.PHONE_NUMBER_AUTHENTICATION,
      page: () => const PhoneNumberAuthentication(),
      binding: PhoneNumberAuthenticationBinding(),
    ),
    // GetPage(
    //   name: Routes.PICK_USER_LOCATION,
    //   page: () => const PickUserLocation(),
    // )
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
