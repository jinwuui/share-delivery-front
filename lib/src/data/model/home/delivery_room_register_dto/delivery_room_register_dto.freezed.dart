// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_room_register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryRoomRegisterDTO _$DeliveryRoomRegisterDTOFromJson(
    Map<String, dynamic> json) {
  return _DeliveryRoomRegisterDTO.fromJson(json);
}

/// @nodoc
mixin _$DeliveryRoomRegisterDTO {
  String get content => throw _privateConstructorUsedError;
  int get deliveryTip => throw _privateConstructorUsedError;
  int get limitPerson => throw _privateConstructorUsedError;
  List<Menu> get menuList => throw _privateConstructorUsedError;
  int get receivingLocationId => throw _privateConstructorUsedError;
  ShareStore get shareStore => throw _privateConstructorUsedError;
  String get storeCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryRoomRegisterDTOCopyWith<DeliveryRoomRegisterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRoomRegisterDTOCopyWith<$Res> {
  factory $DeliveryRoomRegisterDTOCopyWith(DeliveryRoomRegisterDTO value,
          $Res Function(DeliveryRoomRegisterDTO) then) =
      _$DeliveryRoomRegisterDTOCopyWithImpl<$Res>;
  $Res call(
      {String content,
      int deliveryTip,
      int limitPerson,
      List<Menu> menuList,
      int receivingLocationId,
      ShareStore shareStore,
      String storeCategory});

  $ShareStoreCopyWith<$Res> get shareStore;
}

/// @nodoc
class _$DeliveryRoomRegisterDTOCopyWithImpl<$Res>
    implements $DeliveryRoomRegisterDTOCopyWith<$Res> {
  _$DeliveryRoomRegisterDTOCopyWithImpl(this._value, this._then);

  final DeliveryRoomRegisterDTO _value;
  // ignore: unused_field
  final $Res Function(DeliveryRoomRegisterDTO) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? deliveryTip = freezed,
    Object? limitPerson = freezed,
    Object? menuList = freezed,
    Object? receivingLocationId = freezed,
    Object? shareStore = freezed,
    Object? storeCategory = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerson: limitPerson == freezed
          ? _value.limitPerson
          : limitPerson // ignore: cast_nullable_to_non_nullable
              as int,
      menuList: menuList == freezed
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      receivingLocationId: receivingLocationId == freezed
          ? _value.receivingLocationId
          : receivingLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      shareStore: shareStore == freezed
          ? _value.shareStore
          : shareStore // ignore: cast_nullable_to_non_nullable
              as ShareStore,
      storeCategory: storeCategory == freezed
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ShareStoreCopyWith<$Res> get shareStore {
    return $ShareStoreCopyWith<$Res>(_value.shareStore, (value) {
      return _then(_value.copyWith(shareStore: value));
    });
  }
}

/// @nodoc
abstract class _$$_DeliveryRoomRegisterDTOCopyWith<$Res>
    implements $DeliveryRoomRegisterDTOCopyWith<$Res> {
  factory _$$_DeliveryRoomRegisterDTOCopyWith(_$_DeliveryRoomRegisterDTO value,
          $Res Function(_$_DeliveryRoomRegisterDTO) then) =
      __$$_DeliveryRoomRegisterDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String content,
      int deliveryTip,
      int limitPerson,
      List<Menu> menuList,
      int receivingLocationId,
      ShareStore shareStore,
      String storeCategory});

  @override
  $ShareStoreCopyWith<$Res> get shareStore;
}

/// @nodoc
class __$$_DeliveryRoomRegisterDTOCopyWithImpl<$Res>
    extends _$DeliveryRoomRegisterDTOCopyWithImpl<$Res>
    implements _$$_DeliveryRoomRegisterDTOCopyWith<$Res> {
  __$$_DeliveryRoomRegisterDTOCopyWithImpl(_$_DeliveryRoomRegisterDTO _value,
      $Res Function(_$_DeliveryRoomRegisterDTO) _then)
      : super(_value, (v) => _then(v as _$_DeliveryRoomRegisterDTO));

  @override
  _$_DeliveryRoomRegisterDTO get _value =>
      super._value as _$_DeliveryRoomRegisterDTO;

  @override
  $Res call({
    Object? content = freezed,
    Object? deliveryTip = freezed,
    Object? limitPerson = freezed,
    Object? menuList = freezed,
    Object? receivingLocationId = freezed,
    Object? shareStore = freezed,
    Object? storeCategory = freezed,
  }) {
    return _then(_$_DeliveryRoomRegisterDTO(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTip: deliveryTip == freezed
          ? _value.deliveryTip
          : deliveryTip // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerson: limitPerson == freezed
          ? _value.limitPerson
          : limitPerson // ignore: cast_nullable_to_non_nullable
              as int,
      menuList: menuList == freezed
          ? _value._menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      receivingLocationId: receivingLocationId == freezed
          ? _value.receivingLocationId
          : receivingLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      shareStore: shareStore == freezed
          ? _value.shareStore
          : shareStore // ignore: cast_nullable_to_non_nullable
              as ShareStore,
      storeCategory: storeCategory == freezed
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryRoomRegisterDTO implements _DeliveryRoomRegisterDTO {
  const _$_DeliveryRoomRegisterDTO(
      {required this.content,
      required this.deliveryTip,
      required this.limitPerson,
      final List<Menu> menuList = const [],
      required this.receivingLocationId,
      required this.shareStore,
      required this.storeCategory})
      : _menuList = menuList;

  factory _$_DeliveryRoomRegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryRoomRegisterDTOFromJson(json);

  @override
  final String content;
  @override
  final int deliveryTip;
  @override
  final int limitPerson;
  final List<Menu> _menuList;
  @override
  @JsonKey()
  List<Menu> get menuList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuList);
  }

  @override
  final int receivingLocationId;
  @override
  final ShareStore shareStore;
  @override
  final String storeCategory;

  @override
  String toString() {
    return 'DeliveryRoomRegisterDTO(content: $content, deliveryTip: $deliveryTip, limitPerson: $limitPerson, menuList: $menuList, receivingLocationId: $receivingLocationId, shareStore: $shareStore, storeCategory: $storeCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryRoomRegisterDTO &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTip, deliveryTip) &&
            const DeepCollectionEquality()
                .equals(other.limitPerson, limitPerson) &&
            const DeepCollectionEquality().equals(other._menuList, _menuList) &&
            const DeepCollectionEquality()
                .equals(other.receivingLocationId, receivingLocationId) &&
            const DeepCollectionEquality()
                .equals(other.shareStore, shareStore) &&
            const DeepCollectionEquality()
                .equals(other.storeCategory, storeCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(deliveryTip),
      const DeepCollectionEquality().hash(limitPerson),
      const DeepCollectionEquality().hash(_menuList),
      const DeepCollectionEquality().hash(receivingLocationId),
      const DeepCollectionEquality().hash(shareStore),
      const DeepCollectionEquality().hash(storeCategory));

  @JsonKey(ignore: true)
  @override
  _$$_DeliveryRoomRegisterDTOCopyWith<_$_DeliveryRoomRegisterDTO>
      get copyWith =>
          __$$_DeliveryRoomRegisterDTOCopyWithImpl<_$_DeliveryRoomRegisterDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryRoomRegisterDTOToJson(this);
  }
}

abstract class _DeliveryRoomRegisterDTO implements DeliveryRoomRegisterDTO {
  const factory _DeliveryRoomRegisterDTO(
      {required final String content,
      required final int deliveryTip,
      required final int limitPerson,
      final List<Menu> menuList,
      required final int receivingLocationId,
      required final ShareStore shareStore,
      required final String storeCategory}) = _$_DeliveryRoomRegisterDTO;

  factory _DeliveryRoomRegisterDTO.fromJson(Map<String, dynamic> json) =
      _$_DeliveryRoomRegisterDTO.fromJson;

  @override
  String get content => throw _privateConstructorUsedError;
  @override
  int get deliveryTip => throw _privateConstructorUsedError;
  @override
  int get limitPerson => throw _privateConstructorUsedError;
  @override
  List<Menu> get menuList => throw _privateConstructorUsedError;
  @override
  int get receivingLocationId => throw _privateConstructorUsedError;
  @override
  ShareStore get shareStore => throw _privateConstructorUsedError;
  @override
  String get storeCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryRoomRegisterDTOCopyWith<_$_DeliveryRoomRegisterDTO>
      get copyWith => throw _privateConstructorUsedError;
}

ShareStore _$ShareStoreFromJson(Map<String, dynamic> json) {
  return _ShareStore.fromJson(json);
}

/// @nodoc
mixin _$ShareStore {
  String get link => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareStoreCopyWith<ShareStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareStoreCopyWith<$Res> {
  factory $ShareStoreCopyWith(
          ShareStore value, $Res Function(ShareStore) then) =
      _$ShareStoreCopyWithImpl<$Res>;
  $Res call({String link, String name, String type});
}

/// @nodoc
class _$ShareStoreCopyWithImpl<$Res> implements $ShareStoreCopyWith<$Res> {
  _$ShareStoreCopyWithImpl(this._value, this._then);

  final ShareStore _value;
  // ignore: unused_field
  final $Res Function(ShareStore) _then;

  @override
  $Res call({
    Object? link = freezed,
    Object? name = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ShareStoreCopyWith<$Res>
    implements $ShareStoreCopyWith<$Res> {
  factory _$$_ShareStoreCopyWith(
          _$_ShareStore value, $Res Function(_$_ShareStore) then) =
      __$$_ShareStoreCopyWithImpl<$Res>;
  @override
  $Res call({String link, String name, String type});
}

/// @nodoc
class __$$_ShareStoreCopyWithImpl<$Res> extends _$ShareStoreCopyWithImpl<$Res>
    implements _$$_ShareStoreCopyWith<$Res> {
  __$$_ShareStoreCopyWithImpl(
      _$_ShareStore _value, $Res Function(_$_ShareStore) _then)
      : super(_value, (v) => _then(v as _$_ShareStore));

  @override
  _$_ShareStore get _value => super._value as _$_ShareStore;

  @override
  $Res call({
    Object? link = freezed,
    Object? name = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_ShareStore(
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShareStore implements _ShareStore {
  const _$_ShareStore(
      {required this.link, required this.name, required this.type});

  factory _$_ShareStore.fromJson(Map<String, dynamic> json) =>
      _$$_ShareStoreFromJson(json);

  @override
  final String link;
  @override
  final String name;
  @override
  final String type;

  @override
  String toString() {
    return 'ShareStore(link: $link, name: $name, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShareStore &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ShareStoreCopyWith<_$_ShareStore> get copyWith =>
      __$$_ShareStoreCopyWithImpl<_$_ShareStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareStoreToJson(this);
  }
}

abstract class _ShareStore implements ShareStore {
  const factory _ShareStore(
      {required final String link,
      required final String name,
      required final String type}) = _$_ShareStore;

  factory _ShareStore.fromJson(Map<String, dynamic> json) =
      _$_ShareStore.fromJson;

  @override
  String get link => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ShareStoreCopyWith<_$_ShareStore> get copyWith =>
      throw _privateConstructorUsedError;
}
