import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_bank_dto.freezed.dart';
part 'account_bank_dto.g.dart';

@Freezed()
class AccountBankDTO with _$AccountBankDTO {
  const factory AccountBankDTO({
    required String bank,
    required String accountNumber,
    required String accountHolder,
  }) = _AccountBankDTO;

  factory AccountBankDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountBankDTOFromJson(json);
}
