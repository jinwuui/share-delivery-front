import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@Freezed()
class UserLocation with _$UserLocation {
  const factory UserLocation({
    required String description,
    required double latitude,
    required double longitude,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);
}
