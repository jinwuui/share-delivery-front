import 'package:share_delivery/src/data/model/rating_and_report/evaluate_user_request_dto.dart';
import 'package:share_delivery/src/data/model/rating_and_report/report_user_request_dto.dart';
import 'package:share_delivery/src/data/provider/evaluate_and_report/evaluate_and_report_api_client.dart';

class EvaluateAndReportRepository {
  EvaluateAndReportApiClient apiClient;

  EvaluateAndReportRepository({required this.apiClient});

  Future<void> evaluateUser(int targetAccountId, String categoryName) async {
    EvaluateUserRequestDTO requestDTO = EvaluateUserRequestDTO(
      targetAccountId: targetAccountId,
      categoryName: categoryName,
    );

    await apiClient.evaluateUser(requestDTO);
  }

  void reportUser(int accountId, String content) async {
    ReportUserRequestDTO requestDTO = ReportUserRequestDTO(
      accountId: accountId,
      content: content,
    );

    await apiClient.reportUser(requestDTO);
  }
}
