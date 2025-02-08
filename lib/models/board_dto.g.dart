// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardDto _$BoardDtoFromJson(Map<String, dynamic> json) => BoardDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      noticeIds: (json['noticeIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$BoardDtoToJson(BoardDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'noticeIds': instance.noticeIds,
    };
