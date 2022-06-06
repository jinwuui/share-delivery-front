import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_register_request_dto.freezed.dart';
part 'post_register_request_dto.g.dart';

@Freezed()
class PostRegisterRequestDTO with _$PostRegisterRequestDTO {
  const factory PostRegisterRequestDTO({
    required PostLocation coordinate,
    required String content,
    required String category,
    PlaceShare? placeShare,
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
class PlaceShare with _$PlaceShare {
  const factory PlaceShare({
    int? placeShareId,
    required String description,
    required double latitude,
    required double longitude,
  }) = _PlaceShare;

  factory PlaceShare.fromJson(Map<String, dynamic> json) =>
      _$PlaceShareFromJson(json);
}
