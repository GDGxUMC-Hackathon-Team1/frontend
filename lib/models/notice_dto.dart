import 'package:json_annotation/json_annotation.dart';

part 'notice_dto.g.dart'; // JSON 변환을 위한 코드 자동 생성

@JsonSerializable()
class NoticeDto {
  final int id;
  final String title;
  final String url;
  final String summary;
  final int boardId;
  final int hits;
  final String tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoticeDto({
    required this.id,
    required this.title,
    required this.url,
    required this.summary,
    required this.boardId,
    required this.hits,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  // JSON -> 객체 변환
  factory NoticeDto.fromJson(Map<String, dynamic> json) => _$NoticeDtoFromJson(json);

  // 객체 -> JSON 변환
  Map<String, dynamic> toJson() => _$NoticeDtoToJson(this);
}
