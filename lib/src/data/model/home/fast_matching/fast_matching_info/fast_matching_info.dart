import 'package:freezed_annotation/freezed_annotation.dart';

part 'fast_matching_info.freezed.dart';
part 'fast_matching_info.g.dart';

@Freezed()
class FastMatchingInfo with _$FastMatchingInfo {
  const factory FastMatchingInfo({
    required int matchingId,
    required String matchingTag,
    required DateTime participatedDateTime,
  }) = _FastMatchingInfo;

  factory FastMatchingInfo.fromJson(Map<String, dynamic> json) =>
      _$FastMatchingInfoFromJson(json);
}
