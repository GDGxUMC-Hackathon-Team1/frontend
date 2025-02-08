import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/main.dart';

class AdditionalSurveyScreen extends StatefulWidget {
  Set<String>? selectedTags;
  Set<String>? selectedCategories;

  AdditionalSurveyScreen({
    super.key,
    this.selectedCategories,
    this.selectedTags,
  });

  @override
  State<AdditionalSurveyScreen> createState() => _AdditionalSurveyScreenState();
}

class _AdditionalSurveyScreenState extends State<AdditionalSurveyScreen> {
  String? selectedIncome;
  String? selectedResidence;
  final List<String> incomeLevels = ["1분위", "2분위", "3분위", "4분위", "5분위"];
  final List<String> residenceTypes = ["서울", "경기도", "강원도", "충청도", "경상도","전라도","제주도"];
  final TextEditingController gradeController = TextEditingController();


  @override
  void dispose() {
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📌 상단 네비게이션 바 + 진행 바
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      value: 3 / 3, // 3단계 중 현재 진행도
                      backgroundColor: Colors.grey.shade300,
                      color: AppColors.deepPurple,
                      minHeight: 4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📌 질문 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "민경님의 장학금 추천을 위한\n추가 정보를 입력해주세요",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "나중에 변경할 수 있어요",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // 📌 소득분위 선택
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 비활성화된 상태에서 회색 테두리
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 활성화된 상태에서도 회색 테두리
                      ),
                    ),
                    hint: const Text("소득분위 선택"),
                    value: selectedIncome,
                    onChanged: (value) {
                      setState(() {
                        selectedIncome = value;
                      });
                    },
                    items: incomeLevels.map((income) {
                      return DropdownMenuItem(
                        value: income,
                        child: Text(income),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 12),

                  // 📌 거주지 선택
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 비활성화된 상태에서 회색 테두리
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 활성화된 상태에서도 회색 테두리
                      ),
                    ),
                    hint: const Text("거주지 선택"),
                    value: selectedResidence,
                    onChanged: (value) {
                      setState(() {
                        selectedResidence = value;
                      });
                    },
                    items: residenceTypes.map((residence) {
                      return DropdownMenuItem(
                        value: residence,
                        child: Text(residence),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 12),

                  // 📌 성적 입력
                  TextField(
                    controller: gradeController,
                    decoration: InputDecoration(
                      hintText: "성적 입력",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 비활성화된 상태에서 회색 테두리
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.borderLightGray),  // 활성화된 상태에서도 회색 테두리
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📌 캘린더 아이콘 이미지
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/calendar2.png", // 📌 이미지 경로
                  width: 240,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 📌 다음 버튼
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  print(incomeLevels);
                  print(selectedIncome);
                  print(selectedResidence);
                  print(gradeController.text);

                  selectedCategories = widget.selectedCategories ?? {};
                  selectedTags = widget.selectedTags ?? {};
                  income = selectedIncome ?? "8분위";
                  residence = selectedResidence ?? "경기도";
                  grade = gradeController.text;

                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("다음으로", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12,),

          ],
        ),
      ),
    );;
  }
}

