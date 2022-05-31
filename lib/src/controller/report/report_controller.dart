import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/report/report_repository.dart';
import 'package:share_delivery/src/data/repository/report/report_req_dto.dart';

class ReportController extends GetxController {
  static ReportController get to => Get.find();

  final ReportRepository repository;

  ReportController({required this.repository});

  final selectedIndex = 0.obs;

  Future<void> createReport() async {
    ReportReqDTO reportReqDTO = ReportReqDTO(
      reportType: 'DELIVERY_ROOM',
      reportContent: '신고 내용',
      reportTargetAccountId: 123,
    );
    await repository.createReport(reportReqDTO);
  }
}
