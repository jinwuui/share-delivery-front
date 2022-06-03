import 'package:freezed_annotation/freezed_annotation.dart';

part 'fast_matching_request_dto.freezed.dart';
part 'fast_matching_request_dto.g.dart';

@Freezed()
class FastMatchingRequestDTO with _$FastMatchingRequestDTO {
  const factory FastMatchingRequestDTO({
    required String matchingTag,
  }) = _FastMatchingRequestDTO;

  factory FastMatchingRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$FastMatchingRequestDTOFromJson(json);
}
