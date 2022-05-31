import 'package:share_delivery/src/data/model/report/report.dart';
import 'package:share_delivery/src/data/provider/report/report_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/report/report_req_dto.dart';

class ReportRepository {
  final ReportApiClient apiClient;

  ReportRepository({required this.apiClient});

  Future<List<ReportModel>> readReportList() async {
    return await apiClient.readReportList();
  }

  Future<void> createReport(ReportReqDTO reportReqDTO) async {
    return await apiClient.createReport(reportReqDTO);
  }
}
