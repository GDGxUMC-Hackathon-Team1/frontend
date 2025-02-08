import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/widgets/tag.dart';

// 홈 화면 카테고리 카드
class CategoryCard extends StatelessWidget {
  final String category;
  final String description;

  const CategoryCard({
    super.key,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 105,
      padding: const EdgeInsets.only(right: 17, left: 17, top: 18),
      // padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffE1E1E1),  // 테두리 색상
          width: 1,  // 테두리 두께
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 카테고리 명
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                children: [
                  Text(
                    '# ' + category,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 4),

          Text(
           description,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }
}
