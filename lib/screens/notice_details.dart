import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/dropdown.dart';
import 'package:frontend/widgets/notice_card.dart';

import '../widgets/category_card.dart';
import '../widgets/homepage_top_banner.dart';
import '../widgets/relevant_notice_card.dart';
import '../widgets/tag_button.dart';

class NoticeDetailsPage extends StatefulWidget {
  const NoticeDetailsPage({super.key});

  @override
  State<NoticeDetailsPage> createState() => _NoticeDetailsPageState();
}

class _NoticeDetailsPageState extends State<NoticeDetailsPage> {

  // 선택된 값을 추적할 변수
  String? _selectedCategory;

  // 드롭다운 항목들
  final List<String> _categories = [
    '장학금',
    '학사',
    '알림',
    '행사',
    '공지사항',
  ];

  List<String> selectedTags = []; // 선택된 태그 리스트

  // 태그가 선택되었을 때 호출되는 콜백 함수
  void _onTagTapped(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag); // 이미 선택된 태그는 제거
      } else {
        selectedTags.add(tag); // 선택되지 않은 태그는 추가
      }
    });
  }

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
                  Text("카테고리", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10,),
                  DropdownComponent(
                    items: _categories,
                    selectedValue: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    hintText: '카테고리 선택', // 드롭다운 선택 안된 상태에서 보이는 텍스트
                  ),
                  SizedBox(height: 10,),

                  // 2. 여러 태그 버튼들
                  Text("태그", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // 가로로 스크롤 가능
                    child: Row(
                      children: [
                        TagButton(
                          tag: '장학금',
                          onTap: _onTagTapped,
                        ),
                        TagButton(
                          tag: '학사',
                          onTap: _onTagTapped,
                        ),
                        TagButton(
                          tag: '행사',
                          onTap: _onTagTapped,
                        ),
                        TagButton(
                          tag: '공지사항',
                          onTap: _onTagTapped,
                        ),
                      ],
                    ),
                  ),
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

          // 카드
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  ...List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15),  // 각 카드 간의 간격 조정
                      child: Center(
                        child: Column(
                          children: [
                            NoticeCard(
                                category: "장학금",
                                title: "2025학년도 1학기 국가근로장학금 희망근로지 신청 안내",
                                date: "2025.02.07",
                                relevance: 73
                            ),
                            SizedBox(height: 8,),
                          ],
                        )
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}