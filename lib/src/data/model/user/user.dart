import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    required int accountId,
    required String phoneNumber,
    required String nickname,
    @Default("") String profileImage,
    @Default("") String email,
    required String status,
    required String role,
    @Default("") String bankAccount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
