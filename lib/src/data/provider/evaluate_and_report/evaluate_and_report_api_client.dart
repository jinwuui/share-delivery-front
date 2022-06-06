import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/rating_and_report/evaluate_user_request_dto.dart';
import 'package:share_delivery/src/data/model/rating_and_report/report_user_request_dto.dart';

part 'evaluate_and_report_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class EvaluateAndReportApiClient {
  factory EvaluateAndReportApiClient(Dio dio, {String baseUrl}) =
      _EvaluateAndReportApiClient;

  // 사용자 평가
  @POST("/api/evaluations")
  Future<void> evaluateUser(
    @Body() EvaluateUserRequestDTO evaluateUserRequestDTO,
  );

  // 사용자 신고
  @POST("/api/reports")
  Future<void> reportUser(
    @Body() ReportUserRequestDTO reportUserRequestDTO,
  );
}
