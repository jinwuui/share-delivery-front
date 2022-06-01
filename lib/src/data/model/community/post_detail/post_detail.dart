import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/community/post_register_request_dto/post_register_request_dto.dart';

part 'post_detail.freezed.dart';
part 'post_detail.g.dart';

@Freezed()
class PostDetail with _$PostDetail {
  const factory PostDetail({
    required int postId,
    required SharePlace? sharePlace,
    required int likes,
    required bool isLiked,
    required int viewCounts,
    @Default([]) List<String> images,
  }) = _PostDetail;

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);
}
