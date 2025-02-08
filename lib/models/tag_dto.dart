import 'package:json_annotation/json_annotation.dart';

part 'tag_dto.g.dart'; // JSON 변환을 위한 코드 자동 생성

// 📌 TagDto (Flutter)
@JsonSerializable()
class TagDto {
  final int id;
  final String name;
  final String description;

  TagDto({
    required this.id,
    required this.name,
    required this.description,
  });

  // JSON -> 객체 변환
  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  // 객체 -> JSON 변환
  Map<String, dynamic> toJson() => _$TagDtoToJson(this);
}