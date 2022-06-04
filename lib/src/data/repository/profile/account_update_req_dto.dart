import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_req_dto.freezed.dart';
part 'account_update_req_dto.g.dart';

@Freezed()
class AccountUpdateReqDTO with _$AccountUpdateReqDTO {
  const factory AccountUpdateReqDTO({
    String? email,
    required String nickname,
  }) = _AccountUpdateReqDTO;

  factory AccountUpdateReqDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateReqDTOFromJson(json);
}
