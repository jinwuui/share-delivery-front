import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';

part 'login_res_dto.freezed.dart';
part 'login_res_dto.g.dart';

@Freezed()
class LoginResDTO with _$LoginResDTO {
  const factory LoginResDTO({
    required User account,
    required String accessToken,
    required String refreshToken,
  }) = _LoginResDTO;

  factory LoginResDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResDTOFromJson(json);
}
