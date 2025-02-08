import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/widgets/tag.dart';

// 홈 화면 중요한 공지 카드
class RelevantNoticeCard extends StatelessWidget {
  final String category;
  final String title;
  final String summary;
  final int relevance;

  const RelevantNoticeCard({
    super.key,
    required this.category,
    required this.title,
    required this.summary,
    required this.relevance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 상단 태그 (카테고리)
          Align(
            child: Tag(name: category),
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 8),

          // 제목
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22.0),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                const SizedBox(height: 15),

                // 설명 (요약본)
                Text(
                  summary,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
              ],
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
