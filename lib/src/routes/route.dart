import 'package:get/get.dart';
import 'package:share_delivery/src/bindings/delivery_room_register/delivery_room_register_binding.dart';
import 'package:share_delivery/src/bindings/login/phone_number_authentication_binding.dart';
import 'package:share_delivery/src/bindings/login/pick_user_location_binding.dart';
import 'package:share_delivery/src/bindings/root_binding.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/home/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/pick_receiving_location.dart';
import 'package:share_delivery/src/ui/login/login.dart';
import 'package:share_delivery/src/ui/login/phone_number_authentication.dart';
import 'package:share_delivery/src/ui/login/pick_user_location.dart';

abstract class Routes {
  static const INITIAL = "/";

  // 모집글 상세정보
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  // 모집글 등록
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  // 현재 위치 설정
  static const PICK_USER_LOCATION = "/pickUserLocation";
  // 집결지 선택
  static const PICK_RECEIVING_LOCATION = "/pickReceivingLocation";

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
    GetPage(
      name: Routes.DELIVERY_ROOM_DETAIL,
      page: () => const DeliveryRoomDetail(),
    ),
    GetPage(
      name: Routes.DELIVERY_ROOM_REGISTER,
      page: () => const DeliveryRoomRegister(),
      binding: DeliveryRoomRegisterBinding(),
    ),
    GetPage(
      name: Routes.PICK_RECEIVING_LOCATION,
      page: () => const PickReceivingLocation(),
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
  ];
}
