import 'package:freezed_annotation/freezed_annotation.dart';

part 'remittance_res_dto.freezed.dart';
part 'remittance_res_dto.g.dart';

@Freezed()
class RemittanceResDTO with _$RemittanceResDTO {
  const factory RemittanceResDTO({
    required int remittanceId,
    required int accountId,
    required String nickname,
    required int amount,
    required bool isRemitted,
  }) = _RemittanceResDTO;

  factory RemittanceResDTO.fromJson(Map<String, Object?> json) =>
      _$RemittanceResDTOFromJson(json);
}
