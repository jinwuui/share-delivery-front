// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_order_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryOrderDetailDTO _$DeliveryOrderDetailDTOFromJson(
    Map<String, dynamic> json) {
  return _DeliveryOrderDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOrderDetailDTO {
  String get orders => throw _privateConstructorUsedError;
  int get totalOrderPrice => throw _privateConstructorUsedError;
  int get deliveryTip => throw _privateConstructorUsedError;
  List<int> get discounts => throw _privateConstructorUsedError;
  int get totalPaymentPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryOrderDetailDTOCopyWith<DeliveryOrderDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOrderDetailDTOCopyWith<$Res> {
  factory $DeliveryOrderDetailDTOCopyWith(DeliveryOrderDetailDTO value,
          $Res Function(DeliveryOrderDetailDTO) then) =
      _$DeliveryOrderDetailDTOCopyWithImpl<$Res>;
  $Res call(
      {String orders,
      int totalOrderPrice,
      int deliveryTip,
      List<int> discounts,
      int totalPaymentPrice});
}

/// @nodoc
class _$DeliveryOrderDetailDTOCopyWithImpl<$Res>
    implements $DeliveryOrderDetailDTOCopyWith<$Res> {
  _$DeliveryOrderDetailDTOCopyWithImpl(this._value, this._then);

  final DeliveryOrderDetailDTO _value;
  // ignore: unused_field
  final $Res Function(DeliveryOrderDetailDTO) _then;

  @override
  $Res call({
    Object? orders = freezed,
    Object? totalOrderPrice = freezed,
    Object? deliveryTip = freezed,
    Object? discounts = freezed,
    Object? totalPaymentPrice = freezed,
  }) {
    return _then(_value.copyWith(
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderPrice: totalOrderPrice == freezed
          ? _value.totalOrderPrice
          : totalOrderPrice // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      discounts: discounts == freezed
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaymentPrice: totalPaymentPrice == freezed
          ? _value.totalPaymentPrice
          : totalPaymentPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DeliveryOrderDetailDTOCopyWith<$Res>
    implements $DeliveryOrderDetailDTOCopyWith<$Res> {
  factory _$$_DeliveryOrderDetailDTOCopyWith(_$_DeliveryOrderDetailDTO value,
          $Res Function(_$_DeliveryOrderDetailDTO) then) =
      __$$_DeliveryOrderDetailDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String orders,
      int totalOrderPrice,
      int deliveryTip,
      List<int> discounts,
      int totalPaymentPrice});
}

/// @nodoc
class __$$_DeliveryOrderDetailDTOCopyWithImpl<$Res>
    extends _$DeliveryOrderDetailDTOCopyWithImpl<$Res>
    implements _$$_DeliveryOrderDetailDTOCopyWith<$Res> {
  __$$_DeliveryOrderDetailDTOCopyWithImpl(_$_DeliveryOrderDetailDTO _value,
      $Res Function(_$_DeliveryOrderDetailDTO) _then)
      : super(_value, (v) => _then(v as _$_DeliveryOrderDetailDTO));

  @override
  _$_DeliveryOrderDetailDTO get _value =>
      super._value as _$_DeliveryOrderDetailDTO;

  @override
  $Res call({
    Object? orders = freezed,
    Object? totalOrderPrice = freezed,
    Object? deliveryTip = freezed,
    Object? discounts = freezed,
    Object? totalPaymentPrice = freezed,
  }) {
    return _then(_$_DeliveryOrderDetailDTO(
<<<<<<< HEAD
=======
      orderForms: orderForms == freezed
          ? _value.orderForms
          : orderForms // ignore: cast_nullable_to_non_nullable
              as String,
>>>>>>> origin/feature/kakaoMapAPI
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as String,
      totalOrderPrice: totalOrderPrice == freezed
          ? _value.totalOrderPrice
          : totalOrderPrice // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      discounts: discounts == freezed
          ? _value._discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaymentPrice: totalPaymentPrice == freezed
          ? _value.totalPaymentPrice
          : totalPaymentPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryOrderDetailDTO implements _DeliveryOrderDetailDTO {
  const _$_DeliveryOrderDetailDTO(
      {required this.orders,
      required this.totalOrderPrice,
      required this.deliveryTip,
      required final List<int> discounts,
      required this.totalPaymentPrice})
      : _discounts = discounts;

  factory _$_DeliveryOrderDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryOrderDetailDTOFromJson(json);

  @override
  final String orders;
  @override
  final int totalOrderPrice;
  @override
  final int deliveryTip;
  final List<int> _discounts;
  @override
  List<int> get discounts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discounts);
  }

  @override
  final int totalPaymentPrice;

  @override
  String toString() {
    return 'DeliveryOrderDetailDTO(orders: $orders, totalOrderPrice: $totalOrderPrice, deliveryTip: $deliveryTip, discounts: $discounts, totalPaymentPrice: $totalPaymentPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryOrderDetailDTO &&
<<<<<<< HEAD
=======
            const DeepCollectionEquality()
                .equals(other.orderForms, orderForms) &&
>>>>>>> origin/feature/kakaoMapAPI
            const DeepCollectionEquality().equals(other.orders, orders) &&
            const DeepCollectionEquality()
                .equals(other.totalOrderPrice, totalOrderPrice) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTip, deliveryTip) &&
            const DeepCollectionEquality()
                .equals(other._discounts, _discounts) &&
            const DeepCollectionEquality()
                .equals(other.totalPaymentPrice, totalPaymentPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orders),
      const DeepCollectionEquality().hash(totalOrderPrice),
      const DeepCollectionEquality().hash(deliveryTip),
      const DeepCollectionEquality().hash(_discounts),
      const DeepCollectionEquality().hash(totalPaymentPrice));

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryOrderDetailDTOCopyWith<_$_DeliveryOrderDetailDTO> get copyWith =>
      __$$_DeliveryOrderDetailDTOCopyWithImpl<_$_DeliveryOrderDetailDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryOrderDetailDTOToJson(this);
  }
}

abstract class _DeliveryOrderDetailDTO implements DeliveryOrderDetailDTO {
  const factory _DeliveryOrderDetailDTO(
      {required final String orders,
      required final int totalOrderPrice,
      required final int deliveryTip,
      required final List<int> discounts,
      required final int totalPaymentPrice}) = _$_DeliveryOrderDetailDTO;

  factory _DeliveryOrderDetailDTO.fromJson(Map<String, dynamic> json) =
      _$_DeliveryOrderDetailDTO.fromJson;

  @override
  String get orders => throw _privateConstructorUsedError;
  @override
  int get totalOrderPrice => throw _privateConstructorUsedError;
  @override
  int get deliveryTip => throw _privateConstructorUsedError;
  @override
  List<int> get discounts => throw _privateConstructorUsedError;
  @override
  int get totalPaymentPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryOrderDetailDTOCopyWith<_$_DeliveryOrderDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
