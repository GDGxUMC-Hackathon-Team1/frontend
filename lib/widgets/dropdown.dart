import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class DropdownComponent extends StatelessWidget {
  final List<String> items; // 드롭다운 항목 리스트
  final String? selectedValue; // 선택된 값
  final Function(String?) onChanged; // 값이 변경될 때 호출될 콜백 함수
  final String hintText; // 힌트 텍스트

  const DropdownComponent({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // 내부 여백
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
        border: Border.all(
          color: AppColors.borderGray, // 테두리 색상
          width: 2, // 테두리 두께
        ),
        color: Colors.white, // 배경색
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        hint: Text(
          hintText,
          style: TextStyle(
            color: Colors.grey, // 힌트 텍스트 색상
            fontSize: 16, // 힌트 텍스트 크기
          ),
        ),
        isExpanded: true, // 드롭다운이 화면 너비를 가득 채우도록 설정
        onChanged: onChanged, // 값이 바뀔 때 호출될 콜백
        dropdownColor: Colors.white,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // 각 아이템의 간격
              child: Text(
                value,
                style: TextStyle(fontSize: 16), // 아이템 텍스트 크기
              ),
            ),
          );
        }).toList(),
        style: TextStyle(color: Colors.black), // 선택된 텍스트 색상
        underline: SizedBox(), // 밑줄 제거
      ),
    );
  }
}
