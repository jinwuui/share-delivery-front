import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/writing_menu_controller.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/repository/home/participate_room_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class ParticipateRoomController extends GetxController {
  final ParticipateRoomRepository repository;

  ParticipateRoomController({required this.repository});

  final menuList = <MenuInfo>[].obs;
  int curIdx = 0;

  @override
  void onInit() {
    super.onInit();
    initMenuList();
  }

  void initMenuList() {
    menuList.add(MenuInfo(seq: curIdx++, parent: -1));
  }

  void addMenu() {
    menuList.add(MenuInfo(seq: curIdx++, parent: -1));
  }

  void removeMenu(int idx) {
    bool isOption = menuList[idx].seq == -1;
    if (isOption) {
      menuList.removeAt(idx);
    } else {
      int seq = menuList[idx].seq;
      menuList.removeWhere(
          (element) => element.seq == seq || element.parent == seq);
    }
  }

  void addOption(int parentSeq) {
    for (int i = 0; i < menuList.length; i++) {
      if (menuList[i].seq == parentSeq) {
        menuList.insert(i + 1, MenuInfo(seq: -1, parent: parentSeq));
        break;
      }
    }
  }

  void increaseAmount(int idx) {
    if (menuList[idx].quantity < 99) menuList[idx].quantity++;
    update();
  }

  void decreaseAmount(int idx) {
    if (menuList[idx].quantity > 1) menuList[idx].quantity--;
    update();
  }

  Future<void> participateDeliveryRoom(DeliveryRoom deliveryRoom) async {
    await Future.delayed(Duration(milliseconds: 500));
    print('ParticipateRoomController.participateDeliveryRoom');

    if (!validateMenuList()) {
      GetSnackbar.on("입력 에러", "메뉴 정보에 공백이 존재합니다!");
      return;
    }
    if (menuList.isEmpty) {
      GetSnackbar.on("요청", "메뉴를 1개 이상 등록해주세요!");
      return;
    }

    List<Menu> list = convertMenuInfoToMenu();
    String result =
        await repository.participateDeliveryRoom(deliveryRoom.roomId, list);
    if (result == "ACCEPTED") {
      // NOTE : 모집글 참여 신청 완료 시, 페이지 이동

      // NOTE : 1안 - 홈화면까지 pop -> DELIVERY_HISTORY_DETAIL 로 이동
      Get.until((route) => Get.currentRoute == Routes.INITIAL);
      Get.find<RootController>().changeRootPageIndex(1);
      Get.toNamed(Routes.DELIVERY_HISTORY_DETAIL,
          arguments: deliveryRoom.roomId);

      // NOTE : 2안 - 홈화면까지 pop -> DELIVERY_HISTORY_DETAIL 로 이동 (뒤로가기 버튼이 안 생김...)
      // Get.offNamedUntil(
      //   Routes.DELIVERY_HISTORY_DETAIL,
      //   (route) => Get.currentRoute == Routes.INITIAL,
      // );
    } else if (result == "EXCEPTION") {
      print("exception - participateDeliveryRoom");
    } else {
      GetSnackbar.on("실패", result);
    }
  }

  List<Menu> convertMenuInfoToMenu() {
    print('ParticipateRoomController.convertMenuInfoToMenu');

    List<Menu> result = [];
    for (int i = 0; i < menuList.length; i++) {
      List<Menu> options = [];
      MenuInfo menuInfo = menuList[i];

      while (i + 1 < menuList.length && menuList[i + 1].parent != -1) {
        MenuInfo optionInfo = menuList[i + 1];

        Menu option = Menu(
          name: optionInfo.name.text,
          price: int.parse(optionInfo.price.text),
          quantity: optionInfo.quantity,
        );
        i++;

        options.add(option);
      }

      Menu menu = Menu(
        name: menuInfo.name.text,
        price: int.parse(menuInfo.price.text),
        quantity: menuInfo.quantity,
        optionList: options,
      );
      result.add(menu);
    }
    return result;
  }

  bool validateMenuList() {
    print('ParticipateRoomController.validateMenuList');

    for (MenuInfo menu in menuList) {
      if (menu.name.text.isEmpty || menu.price.text.isEmpty) return false;

      for (MenuInfo option in menu.options) {
        if (option.name.text.isEmpty || option.price.text.isEmpty) return false;
      }
    }

    return true;
  }
}
