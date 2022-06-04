import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@Freezed()
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int accountId,
    required String nickname,
    required DateTime createdDate,
    required DateTime modifiedDate,
    @Default("") String profileImageUrl,
    required double mannerScore,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
