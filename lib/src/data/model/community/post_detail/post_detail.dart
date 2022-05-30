import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail.freezed.dart';
part 'post_detail.g.dart';

@Freezed()
class PostDetail with _$PostDetail {
  const factory PostDetail({
    required int postId,
    required Writer writer,
    required String content,
    required String category,
    required DateTime createdDateTime,
    required List<Comment> comments,
  }) = _PostDetail;

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);
}

@Freezed()
class Writer with _$Writer {
  const factory Writer({
    required int id,
    required String nickname,
    required double mannerScore,
  }) = _Writer;

  factory Writer.fromJson(Map<String, dynamic> json) => _$WriterFromJson(json);
}

@Freezed()
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required int parentId,
    required String content,
    required DateTime createdDateTime,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
