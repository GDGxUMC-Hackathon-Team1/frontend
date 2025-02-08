import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/screens/survey_tag_screen.dart';

import 'package:frontend/widgets/PurpleCategoryButton.dart';
import 'package:frontend/widgets/rectangular_elevated_button.dart';


class CategorySurveyScreen extends StatefulWidget {
  const CategorySurveyScreen({super.key});

  @override
  State<CategorySurveyScreen> createState() => _CategorySurveyScreenState();
}

class _CategorySurveyScreenState extends State<CategorySurveyScreen> {
  final List<String> categories = [
    "중앙대학교", "소프트웨어학부", "경영학부", "국제물류학과",
    "AI학과", "교환학생", "레인보우 시스템", "ICT 인턴"
  ];

  final Set<String> selectedCategories = {}; // 선택된 카테고리 저장

  void toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12,),
            // 📌 진행 바
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: 1 / 3, // 3단계 중 현재 단계 진행도
                backgroundColor: Colors.grey.shade300,
                color: AppColors.deepPurple,
                minHeight: 4,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "민경님이 가장 관심있는\n카테고리 게시판을 선택해주세요",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "나중에 변경할 수 있어요",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // 카테고리 버튼 GridView
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // 부모 스크롤과 충돌 방지
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2열 그리드
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1.5, // 버튼 비율 조정
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategories.contains(category);

                  return SizedBox(
                    width: 160,
                    height: 50,
                    child: PurpleCategoryButton(
                      text: category,
                      isSelected: isSelected,
                      onTap: () => toggleCategory(category),
                    ),
                  );
                },
              ),
            ),

            // 📌 다음 버튼
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  // todo 다음으로 넘어가기 + 카테고리 전달
                  print("선택된 카테고리: $selectedCategories");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TagSurveyScreen(selectedCategories: selectedCategories,))
                  );
                },
                child: const Text("다음으로", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
