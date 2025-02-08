import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/widgets/category_card.dart';
import 'package:frontend/widgets/homepage_top_banner.dart';
import 'package:frontend/widgets/notice_card.dart';
import 'package:frontend/widgets/relevant_notice_card.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text(widget.title),
      ),
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 선택된 인덱스를 반영
        onTap: _onItemTapped, // 아이템 클릭 시 호출되는 함수
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home_icon.png', width: 24, height: 24,,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '알림',
          ),
        ],
      ),
      //       body: Column(
//         children: [
//           Container(
//             child: Center(
//               child: HomepageTopBanner(
//                 username: "민경",
//               ),
//             ),
//           ),
//           Container(
//             child: Center(
//               child: CategoryCard(
//                 category: "장학금",
//                 description: "내가 신청할 수 있는 장학금 공지가 있어요",
//               ),
//             ),
//           ),
//           Container(
//             child: Center(
//               child: RelevantNoticeCard(
//                 category: "학사",
//                 title: "2024학년도 동계방학 학부사무실 단축근무 안내",
//                 summary: """
// 2024학년도 동계방학 과사무실
// 단축근무 안내입니다.
//
// 시행 기간: 2024.12.23.(월)
// ~ 2025.2.28.(금) [총 10주]
//             """,
//                 relevance: 75,
//               ),
//             ),
//           ),
//         ],
//       ),

    );
  }
}
