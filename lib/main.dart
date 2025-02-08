import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF5F5F5)),
        fontFamily: "NotoSansKR",
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '0ZR2MI'),
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
