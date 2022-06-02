import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_like_response_dto.freezed.dart';
part 'toggle_like_response_dto.g.dart';

@Freezed()
class PostLikeResponseDTO with _$PostLikeResponseDTO {
  const factory PostLikeResponseDTO({
    required int postId,
    required int likes,
    required bool isLiked,
  }) = _PostLikeResponseDTO;

  factory PostLikeResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PostLikeResponseDTOFromJson(json);
}

@Freezed()
class CommentLikeResponseDTO with _$CommentLikeResponseDTO {
  const factory CommentLikeResponseDTO({
    required int commentId,
    required int likes,
    required bool isLiked,
  }) = _CommentLikeResponseDTO;

  factory CommentLikeResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentLikeResponseDTOFromJson(json);
}
