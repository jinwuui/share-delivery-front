import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/home/fast_matching/fast_matching_repository.dart';
import 'package:share_delivery/src/utils/categories.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

enum FastMatchingStatus {
  initial,
  waiting,
  choosing,
  finished,
}

class FastMatchingController extends GetxController {
  FastMatchingRepository repository;

  FastMatchingController({required this.repository});

  Rx<FastMatchingStatus> status = FastMatchingStatus.initial.obs;

  // 선택된 음식 카테고리
  RxInt pickedFoodCategory = (-1).obs;

  // NOTE: 테스트용 상대방 객체
  Map<String, dynamic> textObj = {
    "accountId": 123,
    "nickname": "테스트계정",
    "mannerScore": 36.5,
    "profileImage": "default",
    "userLocation": {
      "latitude": 38.123123,
      "longitude": 128.123123,
    },
    "distance": 10,
    "category": "CHICKEN",
  };

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
      setStatus(FastMatchingStatus.waiting);
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

  String getFoodCategory(String category) {
    for (int i = 0; i < foodCategories.length; i++) {
      if (foodCategories[i].values.first == category) {
        return foodCategories[i].keys.first;
      }
    }

    return "카테고리 없음";
    // var usdKey = foodCategories.keys
    //     .firstWhere((k) => foodCategories[k] == category, orElse: () => null);
    // return usdKey;
  }

  bool isNotPicked() {
    return pickedFoodCategory.value == -1;
  }

  void setStatus(FastMatchingStatus status) {
    this.status.value = status;
  }
}
