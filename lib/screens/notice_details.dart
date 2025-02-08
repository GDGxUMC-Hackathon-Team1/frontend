import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/notice_card.dart';

import '../widgets/category_card.dart';
import '../widgets/homepage_top_banner.dart';
import '../widgets/relevant_notice_card.dart';

class NoticeDetailsPage extends StatefulWidget {
  const NoticeDetailsPage({super.key});

  @override
  State<NoticeDetailsPage> createState() => _NoticeDetailsPageState();
}

class _NoticeDetailsPageState extends State<NoticeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. 선택
          Container(
            child: Center(
              child: HomepageTopBanner(
                username: "민경",
              ),
            ),
          ),

          // 3. 관심있는 카테고리
          Padding(
            padding: const EdgeInsets.all(25.0),
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