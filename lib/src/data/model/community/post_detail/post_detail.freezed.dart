// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDetail _$PostDetailFromJson(Map<String, dynamic> json) {
  return _PostDetail.fromJson(json);
}

/// @nodoc
mixin _$PostDetail {
  int get postId => throw _privateConstructorUsedError;
  Writer get writer => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDetailCopyWith<PostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailCopyWith<$Res> {
  factory $PostDetailCopyWith(
          PostDetail value, $Res Function(PostDetail) then) =
      _$PostDetailCopyWithImpl<$Res>;
  $Res call(
      {int postId,
      Writer writer,
      String content,
      String topic,
      DateTime createdDateTime,
      List<Comment> comments});

  $WriterCopyWith<$Res> get writer;
}

/// @nodoc
class _$PostDetailCopyWithImpl<$Res> implements $PostDetailCopyWith<$Res> {
  _$PostDetailCopyWithImpl(this._value, this._then);

  final PostDetail _value;
  // ignore: unused_field
  final $Res Function(PostDetail) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? writer = freezed,
    Object? content = freezed,
    Object? topic = freezed,
    Object? createdDateTime = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      writer: writer == freezed
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as Writer,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }

  @override
  $WriterCopyWith<$Res> get writer {
    return $WriterCopyWith<$Res>(_value.writer, (value) {
      return _then(_value.copyWith(writer: value));
    });
  }
}

/// @nodoc
abstract class _$$_PostDetailCopyWith<$Res>
    implements $PostDetailCopyWith<$Res> {
  factory _$$_PostDetailCopyWith(
          _$_PostDetail value, $Res Function(_$_PostDetail) then) =
      __$$_PostDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int postId,
      Writer writer,
      String content,
      String topic,
      DateTime createdDateTime,
      List<Comment> comments});

  @override
  $WriterCopyWith<$Res> get writer;
}

/// @nodoc
class __$$_PostDetailCopyWithImpl<$Res> extends _$PostDetailCopyWithImpl<$Res>
    implements _$$_PostDetailCopyWith<$Res> {
  __$$_PostDetailCopyWithImpl(
      _$_PostDetail _value, $Res Function(_$_PostDetail) _then)
      : super(_value, (v) => _then(v as _$_PostDetail));

  @override
  _$_PostDetail get _value => super._value as _$_PostDetail;

  @override
  $Res call({
    Object? postId = freezed,
    Object? writer = freezed,
    Object? content = freezed,
    Object? topic = freezed,
    Object? createdDateTime = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_PostDetail(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      writer: writer == freezed
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as Writer,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDetail implements _PostDetail {
  const _$_PostDetail(
      {required this.postId,
      required this.writer,
      required this.content,
      required this.topic,
      required this.createdDateTime,
      required final List<Comment> comments})
      : _comments = comments;

  factory _$_PostDetail.fromJson(Map<String, dynamic> json) =>
      _$$_PostDetailFromJson(json);

  @override
  final int postId;
  @override
  final Writer writer;
  @override
  final String content;
  @override
  final String topic;
  @override
  final DateTime createdDateTime;
  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'PostDetail(postId: $postId, writer: $writer, content: $content, topic: $topic, createdDateTime: $createdDateTime, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDetail &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.writer, writer) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(writer),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(topic),
      const DeepCollectionEquality().hash(createdDateTime),
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  _$$_PostDetailCopyWith<_$_PostDetail> get copyWith =>
      __$$_PostDetailCopyWithImpl<_$_PostDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDetailToJson(this);
  }
}

abstract class _PostDetail implements PostDetail {
  const factory _PostDetail(
      {required final int postId,
      required final Writer writer,
      required final String content,
      required final String topic,
      required final DateTime createdDateTime,
      required final List<Comment> comments}) = _$_PostDetail;

  factory _PostDetail.fromJson(Map<String, dynamic> json) =
      _$_PostDetail.fromJson;

  @override
  int get postId => throw _privateConstructorUsedError;
  @override
  Writer get writer => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get topic => throw _privateConstructorUsedError;
  @override
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  @override
  List<Comment> get comments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostDetailCopyWith<_$_PostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Writer _$WriterFromJson(Map<String, dynamic> json) {
  return _Writer.fromJson(json);
}

/// @nodoc
mixin _$Writer {
  int get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  double get mannerScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WriterCopyWith<Writer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriterCopyWith<$Res> {
  factory $WriterCopyWith(Writer value, $Res Function(Writer) then) =
      _$WriterCopyWithImpl<$Res>;
  $Res call({int id, String nickname, double mannerScore});
}

/// @nodoc
class _$WriterCopyWithImpl<$Res> implements $WriterCopyWith<$Res> {
  _$WriterCopyWithImpl(this._value, this._then);

  final Writer _value;
  // ignore: unused_field
  final $Res Function(Writer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nickname = freezed,
    Object? mannerScore = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      mannerScore: mannerScore == freezed
          ? _value.mannerScore
          : mannerScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_WriterCopyWith<$Res> implements $WriterCopyWith<$Res> {
  factory _$$_WriterCopyWith(_$_Writer value, $Res Function(_$_Writer) then) =
      __$$_WriterCopyWithImpl<$Res>;
  @override
  $Res call({int id, String nickname, double mannerScore});
}

/// @nodoc
class __$$_WriterCopyWithImpl<$Res> extends _$WriterCopyWithImpl<$Res>
    implements _$$_WriterCopyWith<$Res> {
  __$$_WriterCopyWithImpl(_$_Writer _value, $Res Function(_$_Writer) _then)
      : super(_value, (v) => _then(v as _$_Writer));

  @override
  _$_Writer get _value => super._value as _$_Writer;

  @override
  $Res call({
    Object? id = freezed,
    Object? nickname = freezed,
    Object? mannerScore = freezed,
  }) {
    return _then(_$_Writer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      mannerScore: mannerScore == freezed
          ? _value.mannerScore
          : mannerScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Writer implements _Writer {
  const _$_Writer(
      {required this.id, required this.nickname, required this.mannerScore});

  factory _$_Writer.fromJson(Map<String, dynamic> json) =>
      _$$_WriterFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  final double mannerScore;

  @override
  String toString() {
    return 'Writer(id: $id, nickname: $nickname, mannerScore: $mannerScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Writer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.mannerScore, mannerScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(mannerScore));

  @JsonKey(ignore: true)
  @override
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      __$$_WriterCopyWithImpl<_$_Writer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WriterToJson(this);
  }
}

abstract class _Writer implements Writer {
  const factory _Writer(
      {required final int id,
      required final String nickname,
      required final double mannerScore}) = _$_Writer;

  factory _Writer.fromJson(Map<String, dynamic> json) = _$_Writer.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  double get mannerScore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  int get parentId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call({int id, int parentId, String content, DateTime createdDateTime});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? content = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call({int id, int parentId, String content, DateTime createdDateTime});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? content = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_$_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {required this.id,
      required this.parentId,
      required this.content,
      required this.createdDateTime});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final int id;
  @override
  final int parentId;
  @override
  final String content;
  @override
  final DateTime createdDateTime;

  @override
  String toString() {
    return 'Comment(id: $id, parentId: $parentId, content: $content, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.createdDateTime, createdDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final int id,
      required final int parentId,
      required final String content,
      required final DateTime createdDateTime}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get parentId => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
