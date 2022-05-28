import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_sms_res_dto.freezed.dart';
part 'auth_sms_res_dto.g.dart';

@Freezed()
class AuthSmsResDTO with _$AuthSmsResDTO {
  const factory AuthSmsResDTO({
    required String requestId,
    required String statusCode,
    required String statusName,
    required DateTime requestTime,
    required String phoneNumber,
    required String verificationType,
  }) = _AuthSmsResDTO;

  factory AuthSmsResDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthSmsResDTOFromJson(json);
}
