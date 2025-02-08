import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';
import 'package:frontend/main.dart';
import 'package:frontend/screens/survey_category_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    String? selectedGender; // 📌 성별 선택 변수

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE), // 배경색 설정
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 📌 앱 제목
                const Text(
                  "나의 공지 알리미,",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                const Text(
                  "0ZR2MI",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // 📌 캘린더 이미지
                Image.asset(
                  "assets/images/calendar.png", // 📌 이미지 경로 설정
                  width: 202,
                  height: 195,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),

                // 📌 입력 필드 (이름, 나이, 성별)
                _buildTextField(controller: nameController, hint: "이름"),
                const SizedBox(height: 12),
                _buildTextField(controller: ageController, hint: "나이", keyboardType: TextInputType.number),
                const SizedBox(height: 12),
                _buildDropdownField(
                  selectedValue: selectedGender,
                  options: ["남", "여"],
                  onChanged: (value) {
                    selectedGender = value;
                    print(selectedGender);
                  },
                ),
                const SizedBox(height: 48),

                // 📌 시작하기 버튼
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      print(selectedGender);
                      print("이름: ${nameController.text}, 나이: ${ageController.text}, 성별: $selectedGender");
                      username = nameController.text;
                      // 📌 다음 화면으로 이동하는 코드 추가 가능
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "0ZR2MI")));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategorySurveyScreen())
                      );
                    },
                    child: const Text("시작하기", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 📌 입력 필드 공통 위젯
  Widget _buildTextField({required TextEditingController controller, required String hint, TextInputType keyboardType = TextInputType.text}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle( // 📌 hintText 스타일 변경
            fontSize: 13, // 글씨 크기 (기본값: 16)
            color: Color(0xFF707070), // 색상 (기본값: 검정색 계열)
            fontWeight: FontWeight.w500, // 글씨 두께 (옵션)
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String? selectedValue,
    required List<String> options,
    required Function(String?) onChanged,
  }) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        hint: const Text("성별 선택"),
        style: const TextStyle(fontSize: 12),
        onChanged: onChanged,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
