// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryOrderDetailModel _$DeliveryOrderDetailModelFromJson(
    Map<String, dynamic> json) {
  return _DeliveryOrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryOrderDetailModel {
  String get deliveryRoomId => throw _privateConstructorUsedError;
  ReceivingLocation get receivingLocation => throw _privateConstructorUsedError;
  List<OrderMenuModel> get orderList => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;
  int get totalOrderMoney => throw _privateConstructorUsedError;
  int get deliveryTip => throw _privateConstructorUsedError;
  String get discountInfoList => throw _privateConstructorUsedError; // TODO: 수정
  int get totalPaymentMoney => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryOrderDetailModelCopyWith<DeliveryOrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryOrderDetailModelCopyWith<$Res> {
  factory $DeliveryOrderDetailModelCopyWith(DeliveryOrderDetailModel value,
          $Res Function(DeliveryOrderDetailModel) then) =
      _$DeliveryOrderDetailModelCopyWithImpl<$Res>;
  $Res call(
      {String deliveryRoomId,
      ReceivingLocation receivingLocation,
      List<OrderMenuModel> orderList,
      DateTime createDate,
      int totalOrderMoney,
      int deliveryTip,
      String discountInfoList,
      int totalPaymentMoney});

  $ReceivingLocationCopyWith<$Res> get receivingLocation;
}

/// @nodoc
class _$DeliveryOrderDetailModelCopyWithImpl<$Res>
    implements $DeliveryOrderDetailModelCopyWith<$Res> {
  _$DeliveryOrderDetailModelCopyWithImpl(this._value, this._then);

  final DeliveryOrderDetailModel _value;
  // ignore: unused_field
  final $Res Function(DeliveryOrderDetailModel) _then;

  @override
  $Res call({
    Object? deliveryRoomId = freezed,
    Object? receivingLocation = freezed,
    Object? orderList = freezed,
    Object? createDate = freezed,
    Object? totalOrderMoney = freezed,
    Object? deliveryTip = freezed,
    Object? discountInfoList = freezed,
    Object? totalPaymentMoney = freezed,
  }) {
    return _then(_value.copyWith(
      deliveryRoomId: deliveryRoomId == freezed
          ? _value.deliveryRoomId
          : deliveryRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      receivingLocation: receivingLocation == freezed
          ? _value.receivingLocation
          : receivingLocation // ignore: cast_nullable_to_non_nullable
              as ReceivingLocation,
      orderList: orderList == freezed
          ? _value.orderList
          : orderList // ignore: cast_nullable_to_non_nullable
              as List<OrderMenuModel>,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrderMoney: totalOrderMoney == freezed
          ? _value.totalOrderMoney
          : totalOrderMoney // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      discountInfoList: discountInfoList == freezed
          ? _value.discountInfoList
          : discountInfoList // ignore: cast_nullable_to_non_nullable
              as String,
      totalPaymentMoney: totalPaymentMoney == freezed
          ? _value.totalPaymentMoney
          : totalPaymentMoney // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ReceivingLocationCopyWith<$Res> get receivingLocation {
    return $ReceivingLocationCopyWith<$Res>(_value.receivingLocation, (value) {
      return _then(_value.copyWith(receivingLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_DeliveryOrderDetailModelCopyWith<$Res>
    implements $DeliveryOrderDetailModelCopyWith<$Res> {
  factory _$$_DeliveryOrderDetailModelCopyWith(
          _$_DeliveryOrderDetailModel value,
          $Res Function(_$_DeliveryOrderDetailModel) then) =
      __$$_DeliveryOrderDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String deliveryRoomId,
      ReceivingLocation receivingLocation,
      List<OrderMenuModel> orderList,
      DateTime createDate,
      int totalOrderMoney,
      int deliveryTip,
      String discountInfoList,
      int totalPaymentMoney});

  @override
  $ReceivingLocationCopyWith<$Res> get receivingLocation;
}

/// @nodoc
class __$$_DeliveryOrderDetailModelCopyWithImpl<$Res>
    extends _$DeliveryOrderDetailModelCopyWithImpl<$Res>
    implements _$$_DeliveryOrderDetailModelCopyWith<$Res> {
  __$$_DeliveryOrderDetailModelCopyWithImpl(_$_DeliveryOrderDetailModel _value,
      $Res Function(_$_DeliveryOrderDetailModel) _then)
      : super(_value, (v) => _then(v as _$_DeliveryOrderDetailModel));

  @override
  _$_DeliveryOrderDetailModel get _value =>
      super._value as _$_DeliveryOrderDetailModel;

  @override
  $Res call({
    Object? deliveryRoomId = freezed,
    Object? receivingLocation = freezed,
    Object? orderList = freezed,
    Object? createDate = freezed,
    Object? totalOrderMoney = freezed,
    Object? deliveryTip = freezed,
    Object? discountInfoList = freezed,
    Object? totalPaymentMoney = freezed,
  }) {
    return _then(_$_DeliveryOrderDetailModel(
      deliveryRoomId: deliveryRoomId == freezed
          ? _value.deliveryRoomId
          : deliveryRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      receivingLocation: receivingLocation == freezed
          ? _value.receivingLocation
          : receivingLocation // ignore: cast_nullable_to_non_nullable
              as ReceivingLocation,
      orderList: orderList == freezed
          ? _value._orderList
          : orderList // ignore: cast_nullable_to_non_nullable
              as List<OrderMenuModel>,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalOrderMoney: totalOrderMoney == freezed
          ? _value.totalOrderMoney
          : totalOrderMoney // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      discountInfoList: discountInfoList == freezed
          ? _value.discountInfoList
          : discountInfoList // ignore: cast_nullable_to_non_nullable
              as String,
      totalPaymentMoney: totalPaymentMoney == freezed
          ? _value.totalPaymentMoney
          : totalPaymentMoney // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryOrderDetailModel implements _DeliveryOrderDetailModel {
  const _$_DeliveryOrderDetailModel(
      {required this.deliveryRoomId,
      required this.receivingLocation,
      required final List<OrderMenuModel> orderList,
      required this.createDate,
      required this.totalOrderMoney,
      required this.deliveryTip,
      required this.discountInfoList,
      required this.totalPaymentMoney})
      : _orderList = orderList;

  factory _$_DeliveryOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryOrderDetailModelFromJson(json);

  @override
  final String deliveryRoomId;
  @override
  final ReceivingLocation receivingLocation;
  final List<OrderMenuModel> _orderList;
  @override
  List<OrderMenuModel> get orderList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderList);
  }

  @override
  final DateTime createDate;
  @override
  final int totalOrderMoney;
  @override
  final int deliveryTip;
  @override
  final String discountInfoList;
// TODO: 수정
  @override
  final int totalPaymentMoney;

  @override
  String toString() {
    return 'DeliveryOrderDetailModel(deliveryRoomId: $deliveryRoomId, receivingLocation: $receivingLocation, orderList: $orderList, createDate: $createDate, totalOrderMoney: $totalOrderMoney, deliveryTip: $deliveryTip, discountInfoList: $discountInfoList, totalPaymentMoney: $totalPaymentMoney)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryOrderDetailModel &&
            const DeepCollectionEquality()
                .equals(other.deliveryRoomId, deliveryRoomId) &&
            const DeepCollectionEquality()
                .equals(other.receivingLocation, receivingLocation) &&
            const DeepCollectionEquality()
                .equals(other._orderList, _orderList) &&
            const DeepCollectionEquality()
                .equals(other.createDate, createDate) &&
            const DeepCollectionEquality()
                .equals(other.totalOrderMoney, totalOrderMoney) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTip, deliveryTip) &&
            const DeepCollectionEquality()
                .equals(other.discountInfoList, discountInfoList) &&
            const DeepCollectionEquality()
                .equals(other.totalPaymentMoney, totalPaymentMoney));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(deliveryRoomId),
      const DeepCollectionEquality().hash(receivingLocation),
      const DeepCollectionEquality().hash(_orderList),
      const DeepCollectionEquality().hash(createDate),
      const DeepCollectionEquality().hash(totalOrderMoney),
      const DeepCollectionEquality().hash(deliveryTip),
      const DeepCollectionEquality().hash(discountInfoList),
      const DeepCollectionEquality().hash(totalPaymentMoney));

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryOrderDetailModelCopyWith<_$_DeliveryOrderDetailModel>
      get copyWith => __$$_DeliveryOrderDetailModelCopyWithImpl<
          _$_DeliveryOrderDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryOrderDetailModelToJson(this);
  }
}

abstract class _DeliveryOrderDetailModel implements DeliveryOrderDetailModel {
  const factory _DeliveryOrderDetailModel(
      {required final String deliveryRoomId,
      required final ReceivingLocation receivingLocation,
      required final List<OrderMenuModel> orderList,
      required final DateTime createDate,
      required final int totalOrderMoney,
      required final int deliveryTip,
      required final String discountInfoList,
      required final int totalPaymentMoney}) = _$_DeliveryOrderDetailModel;

  factory _DeliveryOrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$_DeliveryOrderDetailModel.fromJson;

  @override
  String get deliveryRoomId => throw _privateConstructorUsedError;
  @override
  ReceivingLocation get receivingLocation => throw _privateConstructorUsedError;
  @override
  List<OrderMenuModel> get orderList => throw _privateConstructorUsedError;
  @override
  DateTime get createDate => throw _privateConstructorUsedError;
  @override
  int get totalOrderMoney => throw _privateConstructorUsedError;
  @override
  int get deliveryTip => throw _privateConstructorUsedError;
  @override
  String get discountInfoList => throw _privateConstructorUsedError;
  @override // TODO: 수정
  int get totalPaymentMoney => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryOrderDetailModelCopyWith<_$_DeliveryOrderDetailModel>
      get copyWith => throw _privateConstructorUsedError;
}
