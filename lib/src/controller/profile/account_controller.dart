import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/repository/profile/account_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class AccountController extends GetxController {
  final ProfileRepository repository;

  static AccountController get to => Get.find();
  AccountController({required this.repository});

  // 선택된 음식 카테고리
  final RxInt pickedBank = (-1).obs;

  final bank = "농협".obs;
  final accountNumber = "3521264".obs;
  final accountHolder = "박진우".obs;

  void setPickedBank(int index) {
    pickedBank.value = index;
  }

  Future<void> updateUserAccount() async {
    AccountDTO newAccountDTO = AccountDTO(
        userId: 1,
        bank: bank.value,
        accountNumber: accountNumber.value,
        accountHolder: accountHolder.value);
    try {
      await repository.updateUserAccount(newAccountDTO);
    } catch (e) {
      Logger().w(e);
    }
  }
}
