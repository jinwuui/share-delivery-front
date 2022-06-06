import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/report/report.dart';
import 'package:share_delivery/src/data/repository/report/report_req_dto.dart';

part 'report_api_client.g.dart';

@RestApi()
abstract class ReportApiClient {
  factory ReportApiClient(Dio dio, {String baseUrl}) = _ReportApiClient;

  // 신고 리스트 조회
  @GET('/api/reports')
  Future<List<ReportModel>> readReportList();

  // 신고 등록
  @POST('/api/reports')
  Future<void> createReport(@Body() ReportReqDTO accountDTO);
}
