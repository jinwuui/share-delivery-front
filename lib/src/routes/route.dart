import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/bindings/community/post_detail_binding.dart';
import 'package:share_delivery/src/bindings/community/post_register/post_register_binding.dart';
import 'package:share_delivery/src/bindings/delivery_recruit/delivery_room_detail_binding.dart';
import 'package:share_delivery/src/bindings/delivery_room_register/delivery_room_register_binding.dart';
import 'package:share_delivery/src/bindings/delivery_room_register/pick_receiving_location_binding.dart';
import 'package:share_delivery/src/bindings/home/fast_matching/fast_matching_binding.dart';
import 'package:share_delivery/src/bindings/login/phone_number_authentication_binding.dart';
import 'package:share_delivery/src/bindings/participate_room/participate_room_binding.dart';
import 'package:share_delivery/src/bindings/profile/friend_binding.dart';
import 'package:share_delivery/src/bindings/root_binding.dart';
import 'package:share_delivery/src/bindings/widgets/pick_user_location_binding.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/ui/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/ui/community/post_register/post_register.dart';
import 'package:share_delivery/src/ui/community/post_register/setting_post_category.dart';
import 'package:share_delivery/src/ui/community/writing_comment.dart';
import 'package:share_delivery/src/ui/delivery_post/delivery_room_detail.dart';
import 'package:share_delivery/src/ui/profile/account_manage/select_bank.dart';
import 'package:share_delivery/src/ui/profile/app_setting/app_setting.dart';
import 'package:share_delivery/src/ui/profile/friend/friend.dart';
import 'package:share_delivery/src/ui/widgets/expanded_image_page.dart';
import 'package:share_delivery/src/ui/home/delivery_room_info.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/delivery_room_register.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/pick_receiving_location.dart';
import 'package:share_delivery/src/ui/home/delivery_room_register/writing_menu.dart';
import 'package:share_delivery/src/ui/home/fast_matching/fast_matching.dart';
import 'package:share_delivery/src/ui/home/home.dart';
import 'package:share_delivery/src/ui/home/participate_room/participate_room.dart';
import 'package:share_delivery/src/ui/login/login.dart';
import 'package:share_delivery/src/ui/login/phone_number_authentication.dart';
import 'package:share_delivery/src/ui/widgets/expanded_image_page.dart';
import 'package:share_delivery/src/ui/widgets/pick_user_location.dart';

abstract class Routes {
  // 기본 화면
  static const INITIAL = "/";

  // 홈 화면
  static const HOME = "/home";

  // 모집글 상세정보
  static const DELIVERY_ROOM_INFO = "/deliveryRoomInfo";
  static const DELIVERY_ROOM_DETAIL = "/deliveryRoomDetail";
  static const SHOW_SPECIFIC_SPOT = "/showSpecificSpot";

  // 모집글 등록
  static const DELIVERY_ROOM_REGISTER = "/deliveryRoomRegister";
  static const DELIVERY_HISTORY_DETAIL = "/deliveryHistoryDetail";
  static const EXPANDED_IMAGE_PAGE = "/exapndedImagePage";
  static const WRITING_MENU = "/writingMenu";
  static const PICK_RECEIVING_LOCATION = "/pickReceivingLocation";

  // 모집글 참여 신청
  static const PARTICIPATE_ROOM = "/participateRoom";

  // 빠른 매칭
  static const FAST_MATCHING = "/fastMatching";

  // 현재 위치 설정
  static const PICK_USER_LOCATION = "/pickUserLocation";

  // 로그인
  static const LOGIN = "/login";
  static const PHONE_NUMBER_AUTHENTICATION = "/phoneNumberAuthentication";

  // 프로필
  static const APP_SETTING = "/appSetting";
  static const ACCOUNT_MANAGE = "/accountManage";
  static const SELECT_BANK = "/selectBank";

  // 커뮤니티
  static const POST_REGISTER = "/postRegister";
  static const SETTING_POST_CATEGORY = "/settingPostCategory";
  static const POST_DETAIL = "/postDetail";
  static const WRITING_COMMENT = "/writingComment";

  // 친구 관리
  static const FRIEND = "/friend";
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const Root(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const Home(),
    ),
    GetPage(
      name: Routes.DELIVERY_ROOM_DETAIL,
      page: () => const DeliveryRoomDetail(),
    ),
    GetPage(
      name: Routes.DELIVERY_ROOM_INFO,
      page: () => DeliveryRoomInfo(),
    ),
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
      name: Routes.DELIVERY_HISTORY_DETAIL,
      page: () => const DeliveryRoomDetail(),
      binding: DeliveryRoomDetailBinding(),
    ),
    GetPage(
      name: Routes.EXPANDED_IMAGE_PAGE,
      page: () => const ExpandedImagePage(),
    ),
    GetPage(
      name: Routes.APP_SETTING,
      page: () => const AppSetting(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
    ),
    GetPage(
      name: Routes.WRITING_MENU,
      page: () => const WritingMenu(),
    ),
    GetPage(
      name: Routes.FAST_MATCHING,
      page: () => const FastMatching(),
      binding: FastMatchingBinding(),
    ),
    GetPage(
      name: Routes.PARTICIPATE_ROOM,
      page: () => const ParticipateRoom(),
      binding: ParticipateRoomBinding(),
    ),
    GetPage(
      name: Routes.POST_REGISTER,
      page: () => const PostRegister(),
      curve: Curves.easeOutBack,
      binding: PostRegisterBinding(),
    ),
    GetPage(
      name: Routes.POST_DETAIL,
      page: () => const PostDetail(),
      binding: PostDetailBinding(),
    ),
    GetPage(
      name: Routes.SETTING_POST_CATEGORY,
      page: () => const SettingPostCategory(),
      transition: Transition.fadeIn,
      curve: Curves.decelerate,
    ),
    GetPage(
      name: Routes.PICK_RECEIVING_LOCATION,
      page: () => const PickReceivingLocation(),
      binding: PickReceivingLocationBinding(),
      transition: Transition.fadeIn,
      curve: Curves.decelerate,
    ),
    GetPage(
      name: Routes.SELECT_BANK,
      page: () => const SelectBank(),
    ),
    GetPage(
      name: Routes.FRIEND,
      page: () => FriendPage(),
      binding: FriendBinding(),
    ),
    GetPage(
      name: Routes.WRITING_COMMENT,
      page: () => const WritingComment(),
    ),
  ];
}
