import 'package:flutter/material.dart';

import 'package:frontend/core/app_colors.dart';
import 'package:frontend/screens/survey_additional_screen.dart';

import 'package:frontend/widgets/PurpleCategoryButton.dart';

class TagSurveyScreen extends StatefulWidget {
  Set<String>? selectedCategories;

  TagSurveyScreen({
    super.key,
    this.selectedCategories,
  });

  @override
  State<TagSurveyScreen> createState() => _TagSurveyScreenState();
}

class _TagSurveyScreenState extends State<TagSurveyScreen> {
  final List<String> tags = [
    "학사일정", "장학금", "행사", "기숙사",
    "채용", "졸업사정", "학점교류", "기타"
  ];

  final Set<String> selectedTags = {}; // 선택된 카테고리 저장

  void toggleCategory(String category) {
    setState(() {
      if (selectedTags.contains(category)) {
        selectedTags.remove(category);
      } else {
        selectedTags.add(category);
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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {},
                ),
                const Text(
                  "설문",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 📌 진행 바
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: 2 / 3, // 3단계 중 현재 단계 진행도
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
                itemCount: tags.length,
                itemBuilder: (context, index) {
                  final category = tags[index];
                  final isSelected = selectedTags.contains(category);

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
                  print("선택된 카테고리: ${widget.selectedCategories}");
                  print("선택된 태그: $selectedTags");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdditionalSurveyScreen(selectedCategories: widget.selectedCategories, selectedTags:  selectedTags,))
                  );
                },
                child: const Text("다음으로", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12,),
          ],
        ),
      ),
    );

  }
}
