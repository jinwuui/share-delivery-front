import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluate_user_request_dto.freezed.dart';
part 'evaluate_user_request_dto.g.dart';

@Freezed()
class EvaluateUserRequestDTO with _$EvaluateUserRequestDTO {
  const factory EvaluateUserRequestDTO({
    required int targetAccountId,
    required String categoryName,
  }) = _EvaluateUserRequestDTO;

  factory EvaluateUserRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$EvaluateUserRequestDTOFromJson(json);
}
