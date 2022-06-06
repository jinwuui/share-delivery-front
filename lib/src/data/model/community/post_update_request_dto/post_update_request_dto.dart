import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/community/post_register_request_dto/post_register_request_dto.dart';

part 'post_update_request_dto.freezed.dart';
part 'post_update_request_dto.g.dart';

@Freezed()
class PostUpdateRequestDTO with _$PostUpdateRequestDTO {
  const factory PostUpdateRequestDTO({
    required PostLocation coordinate,
    required String content,
    required String category,
    PlaceShare? placeShare,
    @Default([]) List<String> deletedImages,
  }) = _PostUpdateRequestDTO;

  factory PostUpdateRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PostUpdateRequestDTOFromJson(json);
}
