import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    required int accountId,
    required String phoneNumber,
    required String nickname,
    required String status,
    @Default("") String profileImage,
    String? email,
    String? bank,
    String? accounts,
    String? userName,
    DateTime? joinDate,
    DateTime? modifiedDate,
    DateTime? withdrawDate,
    DateTime? recentDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
