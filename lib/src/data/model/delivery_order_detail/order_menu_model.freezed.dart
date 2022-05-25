// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderMenuModel _$OrderMenuModelFromJson(Map<String, dynamic> json) {
  return _OrderMenuModel.fromJson(json);
}

/// @nodoc
mixin _$OrderMenuModel {
  int get entryOrderId => throw _privateConstructorUsedError;
  int get accountId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Menu> get menus => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderMenuModelCopyWith<OrderMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderMenuModelCopyWith<$Res> {
  factory $OrderMenuModelCopyWith(
          OrderMenuModel value, $Res Function(OrderMenuModel) then) =
      _$OrderMenuModelCopyWithImpl<$Res>;
  $Res call(
      {int entryOrderId,
      int accountId,
      String phoneNumber,
      String type,
      String status,
      List<Menu> menus,
      DateTime createdDateTime});
}

/// @nodoc
class _$OrderMenuModelCopyWithImpl<$Res>
    implements $OrderMenuModelCopyWith<$Res> {
  _$OrderMenuModelCopyWithImpl(this._value, this._then);

  final OrderMenuModel _value;
  // ignore: unused_field
  final $Res Function(OrderMenuModel) _then;

  @override
  $Res call({
    Object? entryOrderId = freezed,
    Object? accountId = freezed,
    Object? phoneNumber = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? menus = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      entryOrderId: entryOrderId == freezed
          ? _value.entryOrderId
          : entryOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      menus: menus == freezed
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderMenuModelCopyWith<$Res>
    implements $OrderMenuModelCopyWith<$Res> {
  factory _$$_OrderMenuModelCopyWith(
          _$_OrderMenuModel value, $Res Function(_$_OrderMenuModel) then) =
      __$$_OrderMenuModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int entryOrderId,
      int accountId,
      String phoneNumber,
      String type,
      String status,
      List<Menu> menus,
      DateTime createdDateTime});
}

/// @nodoc
class __$$_OrderMenuModelCopyWithImpl<$Res>
    extends _$OrderMenuModelCopyWithImpl<$Res>
    implements _$$_OrderMenuModelCopyWith<$Res> {
  __$$_OrderMenuModelCopyWithImpl(
      _$_OrderMenuModel _value, $Res Function(_$_OrderMenuModel) _then)
      : super(_value, (v) => _then(v as _$_OrderMenuModel));

  @override
  _$_OrderMenuModel get _value => super._value as _$_OrderMenuModel;

  @override
  $Res call({
    Object? entryOrderId = freezed,
    Object? accountId = freezed,
    Object? phoneNumber = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? menus = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_$_OrderMenuModel(
      entryOrderId: entryOrderId == freezed
          ? _value.entryOrderId
          : entryOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      menus: menus == freezed
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderMenuModel implements _OrderMenuModel {
  const _$_OrderMenuModel(
      {required this.entryOrderId,
      required this.accountId,
      required this.phoneNumber,
      required this.type,
      required this.status,
      required final List<Menu> menus,
      required this.createdDateTime})
      : _menus = menus;

  factory _$_OrderMenuModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderMenuModelFromJson(json);

  @override
  final int entryOrderId;
  @override
  final int accountId;
  @override
  final String phoneNumber;
  @override
  final String type;
  @override
  final String status;
  final List<Menu> _menus;
  @override
  List<Menu> get menus {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'OrderMenuModel(entryOrderId: $entryOrderId, accountId: $accountId, phoneNumber: $phoneNumber, type: $type, status: $status, menus: $menus, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderMenuModel &&
            const DeepCollectionEquality()
                .equals(other.entryOrderId, entryOrderId) &&
            const DeepCollectionEquality().equals(other.accountId, accountId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entryOrderId),
      const DeepCollectionEquality().hash(accountId),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_menus),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_OrderMenuModelCopyWith<_$_OrderMenuModel> get copyWith =>
      __$$_OrderMenuModelCopyWithImpl<_$_OrderMenuModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderMenuModelToJson(this);
  }
}

abstract class _OrderMenuModel implements OrderMenuModel {
  const factory _OrderMenuModel(
      {required final int entryOrderId,
      required final int accountId,
      required final String phoneNumber,
      required final String type,
      required final String status,
      required final List<Menu> menus,
      required final DateTime createdDateTime}) = _$_OrderMenuModel;

  factory _OrderMenuModel.fromJson(Map<String, dynamic> json) =
      _$_OrderMenuModel.fromJson;

  @override
  int get entryOrderId => throw _privateConstructorUsedError;
  @override
  int get accountId => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  List<Menu> get menus => throw _privateConstructorUsedError;
  @override
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderMenuModelCopyWith<_$_OrderMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  int get orderMenuId => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  List<Menu> get optionMenus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  $Res call(
      {int orderMenuId,
      String menuName,
      int quantity,
      int price,
      List<Menu> optionMenus});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res> implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  final Menu _value;
  // ignore: unused_field
  final $Res Function(Menu) _then;

  @override
  $Res call({
    Object? orderMenuId = freezed,
    Object? menuName = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? optionMenus = freezed,
  }) {
    return _then(_value.copyWith(
      orderMenuId: orderMenuId == freezed
          ? _value.orderMenuId
          : orderMenuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: menuName == freezed
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      optionMenus: optionMenus == freezed
          ? _value.optionMenus
          : optionMenus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
abstract class _$$_MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$_MenuCopyWith(_$_Menu value, $Res Function(_$_Menu) then) =
      __$$_MenuCopyWithImpl<$Res>;
  @override
  $Res call(
      {int orderMenuId,
      String menuName,
      int quantity,
      int price,
      List<Menu> optionMenus});
}

/// @nodoc
class __$$_MenuCopyWithImpl<$Res> extends _$MenuCopyWithImpl<$Res>
    implements _$$_MenuCopyWith<$Res> {
  __$$_MenuCopyWithImpl(_$_Menu _value, $Res Function(_$_Menu) _then)
      : super(_value, (v) => _then(v as _$_Menu));

  @override
  _$_Menu get _value => super._value as _$_Menu;

  @override
  $Res call({
    Object? orderMenuId = freezed,
    Object? menuName = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? optionMenus = freezed,
  }) {
    return _then(_$_Menu(
      orderMenuId: orderMenuId == freezed
          ? _value.orderMenuId
          : orderMenuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: menuName == freezed
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      optionMenus: optionMenus == freezed
          ? _value._optionMenus
          : optionMenus // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Menu implements _Menu {
  const _$_Menu(
      {required this.orderMenuId,
      required this.menuName,
      required this.quantity,
      required this.price,
      final List<Menu> optionMenus = const []})
      : _optionMenus = optionMenus;

  factory _$_Menu.fromJson(Map<String, dynamic> json) => _$$_MenuFromJson(json);

  @override
  final int orderMenuId;
  @override
  final String menuName;
  @override
  final int quantity;
  @override
  final int price;
  final List<Menu> _optionMenus;
  @override
  @JsonKey()
  List<Menu> get optionMenus {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionMenus);
  }

  @override
  String toString() {
    return 'Menu(orderMenuId: $orderMenuId, menuName: $menuName, quantity: $quantity, price: $price, optionMenus: $optionMenus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Menu &&
            const DeepCollectionEquality()
                .equals(other.orderMenuId, orderMenuId) &&
            const DeepCollectionEquality().equals(other.menuName, menuName) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other._optionMenus, _optionMenus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderMenuId),
      const DeepCollectionEquality().hash(menuName),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_optionMenus));

  @JsonKey(ignore: true)
  @override
  _$$_MenuCopyWith<_$_Menu> get copyWith =>
      __$$_MenuCopyWithImpl<_$_Menu>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuToJson(this);
  }
}

abstract class _Menu implements Menu {
  const factory _Menu(
      {required final int orderMenuId,
      required final String menuName,
      required final int quantity,
      required final int price,
      final List<Menu> optionMenus}) = _$_Menu;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$_Menu.fromJson;

  @override
  int get orderMenuId => throw _privateConstructorUsedError;
  @override
  String get menuName => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  List<Menu> get optionMenus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuCopyWith<_$_Menu> get copyWith => throw _privateConstructorUsedError;
}
