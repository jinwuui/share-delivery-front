// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receiving_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceivingLocation _$ReceivingLocationFromJson(Map<String, dynamic> json) {
  return _ReceivingLocation.fromJson(json);
}

/// @nodoc
mixin _$ReceivingLocation {
  String get description => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivingLocationCopyWith<ReceivingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivingLocationCopyWith<$Res> {
  factory $ReceivingLocationCopyWith(
          ReceivingLocation value, $Res Function(ReceivingLocation) then) =
      _$ReceivingLocationCopyWithImpl<$Res>;
  $Res call({String description, double latitude, double longitude});
}

/// @nodoc
class _$ReceivingLocationCopyWithImpl<$Res>
    implements $ReceivingLocationCopyWith<$Res> {
  _$ReceivingLocationCopyWithImpl(this._value, this._then);

  final ReceivingLocation _value;
  // ignore: unused_field
  final $Res Function(ReceivingLocation) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ReceivingLocationCopyWith<$Res>
    implements $ReceivingLocationCopyWith<$Res> {
  factory _$ReceivingLocationCopyWith(
          _ReceivingLocation value, $Res Function(_ReceivingLocation) then) =
      __$ReceivingLocationCopyWithImpl<$Res>;
  @override
  $Res call({String description, double latitude, double longitude});
}

/// @nodoc
class __$ReceivingLocationCopyWithImpl<$Res>
    extends _$ReceivingLocationCopyWithImpl<$Res>
    implements _$ReceivingLocationCopyWith<$Res> {
  __$ReceivingLocationCopyWithImpl(
      _ReceivingLocation _value, $Res Function(_ReceivingLocation) _then)
      : super(_value, (v) => _then(v as _ReceivingLocation));

  @override
  _ReceivingLocation get _value => super._value as _ReceivingLocation;

  @override
  $Res call({
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_ReceivingLocation(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceivingLocation implements _ReceivingLocation {
  const _$_ReceivingLocation(
      {required this.description,
      required this.latitude,
      required this.longitude});

  factory _$_ReceivingLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ReceivingLocationFromJson(json);

  @override
  final String description;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'ReceivingLocation(description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceivingLocation &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$ReceivingLocationCopyWith<_ReceivingLocation> get copyWith =>
      __$ReceivingLocationCopyWithImpl<_ReceivingLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceivingLocationToJson(this);
  }
}

abstract class _ReceivingLocation implements ReceivingLocation {
  const factory _ReceivingLocation(
      {required final String description,
      required final double latitude,
      required final double longitude}) = _$_ReceivingLocation;

  factory _ReceivingLocation.fromJson(Map<String, dynamic> json) =
      _$_ReceivingLocation.fromJson;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReceivingLocationCopyWith<_ReceivingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
