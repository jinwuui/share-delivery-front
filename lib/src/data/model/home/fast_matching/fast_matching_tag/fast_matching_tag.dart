import 'package:freezed_annotation/freezed_annotation.dart';

part 'fast_matching_tag.freezed.dart';
part 'fast_matching_tag.g.dart';

@Freezed()
class FastMatchingTag with _$FastMatchingTag {
  const factory FastMatchingTag({
    required String matchingTag,
  }) = _FastMatchingTag;

  factory FastMatchingTag.fromJson(Map<String, dynamic> json) =>
      _$FastMatchingTagFromJson(json);
}
