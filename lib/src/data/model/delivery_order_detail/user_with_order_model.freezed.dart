// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_with_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWithOrderModel _$UserWithOrderModelFromJson(Map<String, dynamic> json) {
  return _UserWithOrderModel.fromJson(json);
}

/// @nodoc
mixin _$UserWithOrderModel {
  String get userId => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  Map<String, int> get menuList => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWithOrderModelCopyWith<UserWithOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWithOrderModelCopyWith<$Res> {
  factory $UserWithOrderModelCopyWith(
          UserWithOrderModel value, $Res Function(UserWithOrderModel) then) =
      _$UserWithOrderModelCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      DateTime orderDate,
      Map<String, int> menuList,
      String nickname});
}

/// @nodoc
class _$UserWithOrderModelCopyWithImpl<$Res>
    implements $UserWithOrderModelCopyWith<$Res> {
  _$UserWithOrderModelCopyWithImpl(this._value, this._then);

  final UserWithOrderModel _value;
  // ignore: unused_field
  final $Res Function(UserWithOrderModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? orderDate = freezed,
    Object? menuList = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menuList: menuList == freezed
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserWithOrderModelCopyWith<$Res>
    implements $UserWithOrderModelCopyWith<$Res> {
  factory _$$_UserWithOrderModelCopyWith(_$_UserWithOrderModel value,
          $Res Function(_$_UserWithOrderModel) then) =
      __$$_UserWithOrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      DateTime orderDate,
      Map<String, int> menuList,
      String nickname});
}

/// @nodoc
class __$$_UserWithOrderModelCopyWithImpl<$Res>
    extends _$UserWithOrderModelCopyWithImpl<$Res>
    implements _$$_UserWithOrderModelCopyWith<$Res> {
  __$$_UserWithOrderModelCopyWithImpl(
      _$_UserWithOrderModel _value, $Res Function(_$_UserWithOrderModel) _then)
      : super(_value, (v) => _then(v as _$_UserWithOrderModel));

  @override
  _$_UserWithOrderModel get _value => super._value as _$_UserWithOrderModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? orderDate = freezed,
    Object? menuList = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_$_UserWithOrderModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menuList: menuList == freezed
          ? _value._menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserWithOrderModel implements _UserWithOrderModel {
  const _$_UserWithOrderModel(
      {required this.userId,
      required this.orderDate,
      required final Map<String, int> menuList,
      required this.nickname})
      : _menuList = menuList;

  factory _$_UserWithOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserWithOrderModelFromJson(json);

  @override
  final String userId;
  @override
  final DateTime orderDate;
  final Map<String, int> _menuList;
  @override
  Map<String, int> get menuList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_menuList);
  }

  @override
  final String nickname;

  @override
  String toString() {
    return 'UserWithOrderModel(userId: $userId, orderDate: $orderDate, menuList: $menuList, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserWithOrderModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate) &&
            const DeepCollectionEquality().equals(other._menuList, _menuList) &&
            const DeepCollectionEquality().equals(other.nickname, nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(orderDate),
      const DeepCollectionEquality().hash(_menuList),
      const DeepCollectionEquality().hash(nickname));

  @JsonKey(ignore: true)
  @override
  _$$_UserWithOrderModelCopyWith<_$_UserWithOrderModel> get copyWith =>
      __$$_UserWithOrderModelCopyWithImpl<_$_UserWithOrderModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserWithOrderModelToJson(this);
  }
}

abstract class _UserWithOrderModel implements UserWithOrderModel {
  const factory _UserWithOrderModel(
      {required final String userId,
      required final DateTime orderDate,
      required final Map<String, int> menuList,
      required final String nickname}) = _$_UserWithOrderModel;

  factory _UserWithOrderModel.fromJson(Map<String, dynamic> json) =
      _$_UserWithOrderModel.fromJson;

  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  DateTime get orderDate => throw _privateConstructorUsedError;
  @override
  Map<String, int> get menuList => throw _privateConstructorUsedError;
  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserWithOrderModelCopyWith<_$_UserWithOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
