import 'package:flutter/material.dart';
import 'package:frontend/core/app_colors.dart';



class HomepageTopBanner extends StatelessWidget {
  final String username;
  const HomepageTopBanner({
    super.key,
    required this.username,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        color: Colors.white,
        height: 192,
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'NotoSansKR',
                  ),
                  children: [
                    TextSpan(text: "$username님!\n"),
                    const TextSpan(text: "중요한 "),
                    const TextSpan(
                      text: "공지",
                      style: TextStyle(color: AppColors.textPurple),
                    ),
                    const TextSpan(text: "를\n"),
                    const TextSpan(
                      text: "확인",
                      style: TextStyle(color: AppColors.textPurple),
                    ),
                    const TextSpan(text: "해보세요 :)"),
                  ],
                ),
              ),
            ),
            // 이미지
            Image.asset("assets/images/calendar.png", width: 140, height: 140,)
          ],
        ),
      );
  }
}


