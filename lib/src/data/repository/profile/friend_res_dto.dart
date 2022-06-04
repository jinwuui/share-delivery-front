import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'friend_res_dto.freezed.dart';
part 'friend_res_dto.g.dart';

@Freezed()
class FriendResDTO with _$FriendResDTO {
  const factory FriendResDTO({
    required int accountId,
    required String nickname,
    required DateTime createdDate,
    required DateTime modifiedDate,
    @Default("") String profileImageUrl,
    required double mannerScore,
  }) = _FriendResDTO;

  factory FriendResDTO.fromJson(Map<String, dynamic> json) =>
      _$FriendResDTOFromJson(json);
}
