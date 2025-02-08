// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeDto _$NoticeDtoFromJson(Map<String, dynamic> json) => NoticeDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      summary: json['summary'] as String,
      boardId: (json['boardId'] as num).toInt(),
      hits: (json['hits'] as num).toInt(),
      tags: json['tags'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NoticeDtoToJson(NoticeDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'summary': instance.summary,
      'boardId': instance.boardId,
      'hits': instance.hits,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
