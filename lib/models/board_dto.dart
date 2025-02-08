import 'package:json_annotation/json_annotation.dart';

part 'board_dto.g.dart'; // JSON 변환을 위한 코드 자동 생성

// 📌 BoardDto (Flutter)
@JsonSerializable()
class BoardDto {
  final int id;
  final String title;
  final String url;
  final List<int> noticeIds;

  BoardDto({
    required this.id,
    required this.title,
    required this.url,
    required this.noticeIds,
  });

  // JSON -> 객체 변환
  factory BoardDto.fromJson(Map<String, dynamic> json) => _$BoardDtoFromJson(json);

  // 객체 -> JSON 변환
  Map<String, dynamic> toJson() => _$BoardDtoToJson(this);
}
