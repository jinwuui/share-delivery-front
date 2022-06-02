import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_register_request_dto.freezed.dart';
part 'post_register_request_dto.g.dart';

@Freezed()
class PostRegisterRequestDTO with _$PostRegisterRequestDTO {
  const factory PostRegisterRequestDTO({
    required PostLocation coordinate,
    required String content,
    required String category,
    SharePlace? sharePlace,
  }) = _PostRegisterRequestDTO;

  factory PostRegisterRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PostRegisterRequestDTOFromJson(json);
}

@Freezed()
class PostLocation with _$PostLocation {
  const factory PostLocation({
    required double latitude,
    required double longitude,
  }) = _PostLocation;

  factory PostLocation.fromJson(Map<String, dynamic> json) =>
      _$PostLocationFromJson(json);
}

@Freezed()
class SharePlace with _$SharePlace {
  const factory SharePlace({
    required String description,
    required double latitude,
    required double longitude,
  }) = _SharePlace;

  factory SharePlace.fromJson(Map<String, dynamic> json) =>
      _$SharePlaceFromJson(json);
}
