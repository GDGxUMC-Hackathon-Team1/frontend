import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/dropdown.dart';
import 'package:frontend/widgets/notice_card.dart';

import '../widgets/category_card.dart';
import '../widgets/homepage_top_banner.dart';
import '../widgets/relevant_notice_card.dart';
import '../widgets/tag_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. 카테고리 선택

                ],
              ),
            ),
          ),

          // 3. 관심있는 카테고리
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('# 나에게 맞는 공지 안내', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}