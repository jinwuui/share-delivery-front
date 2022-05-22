import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/home/fast_matching/fast_matching_repository.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';
import 'package:share_delivery/src/utils/store_categories.dart';

class FastMatchingController extends GetxController {
  FastMatchingRepository repository;

  FastMatchingController({required this.repository});

  // 현재 UI
  RxInt curPage = 0.obs;

  // 선택된 음식 카테고리
  RxInt pickedFoodCategory = (-1).obs;

  Future<void> participateFastMatching() async {
    await Future.delayed(Duration(milliseconds: 500));

    // 1. 서버에 빠른 매칭 참여 요청
    String tag = foodCategories[pickedFoodCategory.value].values.first;
    print('FastMatchingController.participateFastMatching $tag');
    // bool isAccepted = await repository.requestFastMatching(tag);
    bool isAccepted = true;

    // 2-1. 빠른 매칭 참여 승인되면 UI 변경
    if (isAccepted) {
      print("isAccepted");
      moveSecondPage();
    } else {
      GetSnackbar.on("알림", "다시 시도해주세요");
    }

    // 2-2. 빠른 매칭 참여 거절되면 스낵바 띄워주기
  }

  void setPickedFoodCategory(int index) {
    pickedFoodCategory.value = index;
  }

  String getPickedFoodCategory() {
    return pickedFoodCategory.value != -1
        ? foodCategories[pickedFoodCategory.value].keys.first
        : "";
  }

  bool isNotPicked() {
    return pickedFoodCategory.value == -1;
  }

  void moveSecondPage() {
    curPage.value = 1;
  }

  void moveFirstPage() {
    curPage.value = 0;
  }

  bool isFirstPage() {
    return curPage.value == 0;
  }
}
