import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

import '../widgets/category_card.dart';
import '../widgets/homepage_top_banner.dart';
import '../widgets/relevant_notice_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;  // 현재 페이지를 추적할 변수
  final CarouselSliderController _controller = CarouselSliderController(); // CarouselSliderController 사용

  // 슬라이드로 보여줄 아이템
  final List<Widget> carouselWidgets = [
    // 슬라이더 위젯 컨테이너
    Expanded(
      child: Container(
            child: Center(
              child: RelevantNoticeCard(
                category: "학사",
                title: "2024학년도 동계방학 학부사무실 단축근무 안내",
                summary: """
2024학년도 동계방학 과사무실
단축근무 안내입니다.

시행 기간: 2024.12.23.(월)
~ 2025.2.28.(금) [총 10주]
            """,
                relevance: 75,
              ),
            ),
          ),
    ),
    Expanded(
      child: Container(
        child: Center(
          child: RelevantNoticeCard(
            category: "학사",
            title: "학위수여식 졸업기념품 배부 안내",
            summary: """
졸업기념품 수령 대상 및 수령 방법
안내입니다.

수령 기간: 2025.02.17.(월) 
~ 2025.2.21.(금) 
            """,
            relevance: 80,
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        child: Center(
          child: RelevantNoticeCard(
            category: "기타",
            title: "2025-1학기 다전공 선발 결과 안내",
            summary: """
소프트웨어대학의 2025-1학기
다전공 선발 결과를 안내합니다.
            """,
            relevance: 50,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("HomePage: $selectedCategories");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 상단 문구
            Container(
              child: Center(
                child: HomepageTopBanner(
                  username: username,
                ),
              ),
            ),

            // 2. 슬라이더 위젯
            Column(
              children: [
                // CarouselSlider 구현
                CarouselSlider(
                  carouselController: _controller,  // CarouselSliderController 사용
                  options: CarouselOptions(
                    aspectRatio: 1.2,  // 화면 비율
                    enlargeCenterPage: true,  // 가운데 슬라이드를 크게 표시
                    viewportFraction: 1.0,  // 각 슬라이드가 화면을 가득 채우도록 설정
                    scrollDirection: Axis.horizontal,  // 슬라이드 방향
                    autoPlay: true,  // 자동 재생
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;  // 페이지 변경 시 현재 인덱스 업데이트
                      });
                    },
                  ),
                  items: carouselWidgets,  // 슬라이드에 표시할 아이템들
                ),

                // 페이지 인덱스 표시
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselWidgets.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.jumpToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? Color(0xff1C159D)
                              : Color(0xffC8C8C8),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10,),

            // 3. 관심있는 카테고리
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('관심있는 카테고리', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                      SizedBox(height: 5,),
                      Text('즐겨찾는 태그와 게시판을 확인해보세요', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    ],
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),

            // 카드
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,  // 가로 스크롤
              padding: EdgeInsets.only(left: 25),
              child: Row(
                children:
                selectedTags.map((tag) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Center(
                      child: CategoryCard(
                          category: tag,
                          description: categoryMap[tag] ?? ""
                      ),
                    ),
                  );
                }).toList() +
                selectedCategories.map((category) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Center(
                      child: CategoryCard(
                          category: category,
                          description: categoryMap[category] ?? ""
                      ),
                    ),
                  );
                }).toList()
                // children: [
                //   ...List.generate(5, (index) {
                //     return Container(
                //       margin: EdgeInsets.only(right: 15),  // 각 카드 간의 간격 조정
                //       child: Center(
                //         child: CategoryCard(
                //           category: "장학금",
                //           description: "내가 신청할 수 있는 장학금 공지가 있어요",
                //         ),
                //       ),
                //     );
                //   }),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}