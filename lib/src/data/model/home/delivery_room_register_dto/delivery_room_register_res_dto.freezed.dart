// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_room_register_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryRoomRegisterResDTO _$DeliveryRoomRegisterResDTOFromJson(
    Map<String, dynamic> json) {
  return _DeliveryRoomRegisterResDTO.fromJson(json);
}

/// @nodoc
mixin _$DeliveryRoomRegisterResDTO {
  int? get roomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryRoomRegisterResDTOCopyWith<DeliveryRoomRegisterResDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRoomRegisterResDTOCopyWith<$Res> {
  factory $DeliveryRoomRegisterResDTOCopyWith(DeliveryRoomRegisterResDTO value,
          $Res Function(DeliveryRoomRegisterResDTO) then) =
      _$DeliveryRoomRegisterResDTOCopyWithImpl<$Res>;
  $Res call({int? roomId});
}

/// @nodoc
class _$DeliveryRoomRegisterResDTOCopyWithImpl<$Res>
    implements $DeliveryRoomRegisterResDTOCopyWith<$Res> {
  _$DeliveryRoomRegisterResDTOCopyWithImpl(this._value, this._then);

  final DeliveryRoomRegisterResDTO _value;
  // ignore: unused_field
  final $Res Function(DeliveryRoomRegisterResDTO) _then;

  @override
  $Res call({
    Object? roomId = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeliveryRoomRegisterResDTOCopyWith<$Res>
    implements $DeliveryRoomRegisterResDTOCopyWith<$Res> {
  factory _$$_DeliveryRoomRegisterResDTOCopyWith(
          _$_DeliveryRoomRegisterResDTO value,
          $Res Function(_$_DeliveryRoomRegisterResDTO) then) =
      __$$_DeliveryRoomRegisterResDTOCopyWithImpl<$Res>;
  @override
  $Res call({int? roomId});
}

/// @nodoc
class __$$_DeliveryRoomRegisterResDTOCopyWithImpl<$Res>
    extends _$DeliveryRoomRegisterResDTOCopyWithImpl<$Res>
    implements _$$_DeliveryRoomRegisterResDTOCopyWith<$Res> {
  __$$_DeliveryRoomRegisterResDTOCopyWithImpl(
      _$_DeliveryRoomRegisterResDTO _value,
      $Res Function(_$_DeliveryRoomRegisterResDTO) _then)
      : super(_value, (v) => _then(v as _$_DeliveryRoomRegisterResDTO));

  @override
  _$_DeliveryRoomRegisterResDTO get _value =>
      super._value as _$_DeliveryRoomRegisterResDTO;

  @override
  $Res call({
    Object? roomId = freezed,
  }) {
    return _then(_$_DeliveryRoomRegisterResDTO(
      roomId: roomId == freezed
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryRoomRegisterResDTO implements _DeliveryRoomRegisterResDTO {
  const _$_DeliveryRoomRegisterResDTO({this.roomId});

  factory _$_DeliveryRoomRegisterResDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryRoomRegisterResDTOFromJson(json);

  @override
  final int? roomId;

  @override
  String toString() {
    return 'DeliveryRoomRegisterResDTO(roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryRoomRegisterResDTO &&
            const DeepCollectionEquality().equals(other.roomId, roomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(roomId));

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryRoomRegisterResDTOCopyWith<_$_DeliveryRoomRegisterResDTO>
      get copyWith => __$$_DeliveryRoomRegisterResDTOCopyWithImpl<
          _$_DeliveryRoomRegisterResDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryRoomRegisterResDTOToJson(this);
  }
}

abstract class _DeliveryRoomRegisterResDTO
    implements DeliveryRoomRegisterResDTO {
  const factory _DeliveryRoomRegisterResDTO({final int? roomId}) =
      _$_DeliveryRoomRegisterResDTO;

  factory _DeliveryRoomRegisterResDTO.fromJson(Map<String, dynamic> json) =
      _$_DeliveryRoomRegisterResDTO.fromJson;

  @override
  int? get roomId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryRoomRegisterResDTOCopyWith<_$_DeliveryRoomRegisterResDTO>
      get copyWith => throw _privateConstructorUsedError;
}
