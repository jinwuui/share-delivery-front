import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@Freezed()
class Post with _$Post {
  const factory Post({
    @Default(-1) int postId,
    required String content,
    required String topic,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
