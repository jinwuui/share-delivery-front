import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_req_dto.freezed.dart';
part 'login_req_dto.g.dart';

@Freezed()
class LoginReqDTO with _$LoginReqDTO {
  const factory LoginReqDTO({
    required String phoneNumber,
    required String verificationCode,
    required String fcmToken,
  }) = _LoginReqDTO;

  factory LoginReqDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginReqDTOFromJson(json);
}
