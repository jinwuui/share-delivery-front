import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@Freezed()
class AccountDTO with _$AccountDTO {
  const factory AccountDTO({
    required int userId,
    required String bank,
    required String accountNumber,
    required String accountHolder,
  }) = _AccountDTO;

  factory AccountDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountDTOFromJson(json);
}
