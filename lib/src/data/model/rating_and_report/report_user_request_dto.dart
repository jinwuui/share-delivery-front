import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_user_request_dto.freezed.dart';
part 'report_user_request_dto.g.dart';

@Freezed()
class ReportUserRequestDTO with _$ReportUserRequestDTO {
  const factory ReportUserRequestDTO({
    required int accountId,
    required String content,
  }) = _ReportUserRequestDTO;

  factory ReportUserRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ReportUserRequestDTOFromJson(json);
}
