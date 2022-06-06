import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_req_dto.freezed.dart';
part 'report_req_dto.g.dart';

@Freezed()
class ReportReqDTO with _$ReportReqDTO {
  const factory ReportReqDTO({
    required int reportedAccountId,
    required String reportCategory,
    required String reportType,
    @Default("dummy") String description,
  }) = _ReportReqDTO;

  factory ReportReqDTO.fromJson(Map<String, dynamic> json) =>
      _$ReportReqDTOFromJson(json);
}
