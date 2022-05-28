import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@Freezed()
class Post with _$Post {
  const factory Post({
    @Default(-1) int postId,
    required PostLocation coordinate,
    required String content,
    required String postCategory,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
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
