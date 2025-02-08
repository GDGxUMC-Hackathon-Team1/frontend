import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';

class TagButton extends StatefulWidget {
  final String tag; // 태그의 텍스트
  final Function(String) onTap; // 태그가 눌렸을 때 호출될 콜백

  const TagButton({
    Key? key,
    required this.tag,
    required this.onTap,
  }) : super(key: key);

  @override
  _TagButtonState createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool _isSelected = false; // 태그의 선택 상태

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected; // 태그가 눌릴 때 상태를 반전시킴
        });
        widget.onTap(widget.tag); // 태그 눌렀을 때 호출되는 콜백
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: _isSelected ? AppColors.tagBackgroundPurple :AppColors.tagBackgroundLightGray, // 선택 여부에 따라 색상 변경
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: Colors.transparent, // 선택된 상태에서 테두리 색상
            width: 2,
          ),
        ),
        child: Text(
          widget.tag,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black, // 선택된 상태에서 텍스트 색상
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
