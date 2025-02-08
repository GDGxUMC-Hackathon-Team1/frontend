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
                category: "채용",
                title: "2025년도 상반기 ICT 학점연계 인턴십 국내과정 모집 안내",
                summary: """
2025년도 상반기 ICT 학점연계 인턴십 국내과정 모집입니다.
1월 21일(화) ~ 1월 26일(일)
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
            category: "졸업사정",
            title: "[졸업식] 2025년 2월 대학별 학위수여식 일정 및 학위복 대여 절차",
            summary: """
2025년 2월 학위수여식 일정과 학위복 대여 절차가 공지되었습니다.
폼 작성 기간: 2월 7일(금) ~ 2월 21일(금) 
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