import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/widgets/tag.dart';

// 상세조회 공지 카드
class NoticeCard extends StatelessWidget {
  final String category;
  final String title;
  final String date;
  final int relevance;

  const NoticeCard({
    super.key,
    required this.category,
    required this.title,
    required this.date,
    required this.relevance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 28),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 상단 태그 (카테고리)
              Tag(name: category),

              // 날짜
              Text(
                date, style: TextStyle(color: AppColors.textGray, fontSize: 15,fontWeight: FontWeight.w500, fontFamily: 'NotoSansKR'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 제목
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // 적합도 바
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "적합도",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(width: 8,),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: relevance / 100.0,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColors.deepPurple,
                  ),
                ),
              ),

              const SizedBox(width:8),

              Text(
                "$relevance%",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
