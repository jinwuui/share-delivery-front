import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_req_dto.freezed.dart';
part 'sign_up_req_dto.g.dart';

@Freezed()
class SignUpReqDTO with _$SignUpReqDTO {
  const factory SignUpReqDTO({
    required String phoneNumber,
    required String verificationCode,
  }) = _SignUpReqDTO;

  factory SignUpReqDTO.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqDTOFromJson(json);
}
