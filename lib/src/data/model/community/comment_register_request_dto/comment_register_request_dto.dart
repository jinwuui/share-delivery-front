import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_register_request_dto.freezed.dart';
part 'comment_register_request_dto.g.dart';

@Freezed()
class CommentRegisterRequestDTO with _$CommentRegisterRequestDTO {
  const factory CommentRegisterRequestDTO({
    required int postId,
    required int? parentId,
    required String content,
  }) = _CommentRegisterRequestDTO;

  factory CommentRegisterRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentRegisterRequestDTOFromJson(json);
}
