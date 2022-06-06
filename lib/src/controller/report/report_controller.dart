import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/report/report_repository.dart';
import 'package:share_delivery/src/utils/categories.dart';

class ReportController extends GetxController {
  static ReportController get to => Get.find();

  final ReportRepository repository;

  ReportController({required this.repository});

  final selectedIndex = 0.obs;

  Future<void> createReport() async {
    int reportedAccountId = Get.arguments["reportedAccountId"];

    print(
        "$reportedAccountId 번 유저를 신고합니다 - 죄목 : ${reportCategories[selectedIndex.value]}");

    await repository.createReport(
      reportedAccountId,
      reportCategories[selectedIndex.value],
      "DELIVERY_ROOM",
    );
  }
}
