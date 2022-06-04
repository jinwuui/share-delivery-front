import 'package:freezed_annotation/freezed_annotation.dart';

part 'fast_matching_response_dto.freezed.dart';
part 'fast_matching_response_dto.g.dart';

@Freezed()
class FastMatchingResponseDTO with _$FastMatchingResponseDTO {
  const factory FastMatchingResponseDTO({
    required int matchingId,
    required String matchingTag,
    required DateTime participatedDateTime,
  }) = _FastMatchingResponseDTO;

  factory FastMatchingResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$FastMatchingResponseDTOFromJson(json);
}
