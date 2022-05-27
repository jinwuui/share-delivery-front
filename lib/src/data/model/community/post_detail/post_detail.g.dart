// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDetail _$$_PostDetailFromJson(Map<String, dynamic> json) =>
    _$_PostDetail(
      postId: json['postId'] as int,
      writer: Writer.fromJson(json['writer'] as Map<String, dynamic>),
      content: json['content'] as String,
      topic: json['topic'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostDetailToJson(_$_PostDetail instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'writer': instance.writer,
      'content': instance.content,
      'topic': instance.topic,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'comments': instance.comments,
    };

_$_Writer _$$_WriterFromJson(Map<String, dynamic> json) => _$_Writer(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      mannerScore: (json['mannerScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WriterToJson(_$_Writer instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'mannerScore': instance.mannerScore,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as int,
      parentId: json['parentId'] as int,
      content: json['content'] as String,
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'content': instance.content,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };
