import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/screens/landing_page.dart';
import 'package:frontend/screens/notice_details.dart';
import 'package:frontend/screens/survey_additional_screen.dart';
import 'package:frontend/screens/survey_category_screen.dart';
import 'package:frontend/widgets/category_card.dart';
import 'package:frontend/widgets/homepage_top_banner.dart';
import 'package:frontend/widgets/notice_card.dart';
import 'package:frontend/widgets/relevant_notice_card.dart';

void main() {
  runApp(const MyApp());
}

// 사용자 전역변수
Set<String> selectedTags = {};
Set<String> selectedCategories = {};
String grade = "";
String income = "";
String residence = "";
String username = "민경";
Map<String, String> categoryMap = {
  "취업정보": "대기업, 스타트업, 공공기관 등 다양한 기업의 최신 채용 정보를 한눈에 확인하세요",
  "기숙사": "기숙사 신청, 입·퇴사 일정, 시설 안내 등을 확인하세요.",
  "학사일정": "수강신청, 개강·종강, 시험 일정 등 학사 일정을 한눈에!",
  "장학": "다양한 장학금 신청 및 선발 공지를 놓치지 마세요.",
  "행사": "교내·외 행사, 특강, 세미나 등 다양한 이벤트 정보를 제공합니다.",
  "학점교류": "타 대학과의 학점 교류 신청 및 관련 정보를 확인하세요.",
  "채용": "다양한 기업의 최신 채용 정보를 한눈에 확인하세요.",
  "일반": "대학 생활에 필요한 다양한 일반 공지를 모았습니다.",
  "연구": "연구 지원, 프로젝트 공모, 학술대회 등 연구 관련 정보를 제공합니다.",
  "졸업사정": "졸업 요건, 학점 심사, 졸업식 일정 등을 확인하세요.",
  "기타": "분류되지 않은 다양한 공지사항을 한곳에서 확인하세요.",
};
String SERVER_URL = "http://13.124.235.66:8080";



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF5F5F5)),
        fontFamily: "NotoSansKR",
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: '0ZR2MI'),
      home: const LandingPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  // 각 인덱스에 맞는 페이지를 보여주기 위한 위젯
  final List<Widget> _pages = [
    HomePage(),  // 첫 번째 인덱스에서 HomePage 위젯을 표시
    // LandingPage(),
    NoticeDetailsPage(),
    CategorySurveyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text('  '+ widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 72,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex, // 현재 선택된 인덱스를 반영
          onTap: _onItemTapped, // 아이템 클릭 시 호출되는 함수
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset('assets/images/icon1.png', width: 24, height: 24,),
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset('assets/images/icon2.png', width: 24, height: 24,),
              ),
              label: '상세조회',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset('assets/images/icon3.png', width: 24, height: 24,),
              ),
              label: '내 정보',
            ),
          ],
          selectedIconTheme: IconThemeData(size: 24),  // 선택된 아이템 아이콘 크기
          unselectedIconTheme: IconThemeData(size: 24), // 선택되지 않은 아이템 아이콘 크기
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: Colors.black,  // 선택된 아이템 색상
          unselectedItemColor: Colors.black,  // 선택되지 않은 아이템 색상
          backgroundColor: Colors.white,
        ),
      ),

    );
  }
}
