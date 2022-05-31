import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_req_dto.freezed.dart';
part 'report_req_dto.g.dart';

@Freezed()
class ReportReqDTO with _$ReportReqDTO {
  const factory ReportReqDTO({
    //TODO: property
    required int reportTargetAccountId,
    required String reportType,
    required String reportContent,
  }) = _ReportReqDTO;

  factory ReportReqDTO.fromJson(Map<String, dynamic> json) =>
      _$ReportReqDTOFromJson(json);
}
