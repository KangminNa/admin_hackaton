import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final bool isLoggedIn; // 로그인 상태를 받을 변수

  const Home({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 로그인 상태를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("사용자 이름"), // 사용자 이름 표시
              accountEmail: Text("user@example.com"), // 사용자 이메일 표시
              currentAccountPicture: CircleAvatar(
                // 사용자 프로필 사진 표시
                backgroundImage: AssetImage("assets/profile_image.jpg"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text("메모"),
              onTap: () {
                // 메모 버튼 눌렀을 때의 동작 추가
                // 예를 들어, 메모 페이지로 이동하는 코드를 여기에 추가
                Navigator.of(context).pushReplacementNamed(
                  '/memo',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text("질문"),
              onTap: () {
                // 질문 버튼 눌렀을 때의 동작 추가
                // 예를 들어, 질문 페이지로 이동하는 코드를 여기에 추가
                Navigator.of(context).pushReplacementNamed(
                  '/help',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text("채팅"),
              onTap: () {
                // 채팅 버튼 눌렀을 때의 동작 추가
                // 예를 들어, 채팅 페이지로 이동하는 코드를 여기에 추가
                Navigator.of(context).pushReplacementNamed(
                  '/chatting',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("공유"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/share',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.man),
              title: const Text("파트너 구하기"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  '/together',
                );
              },
            ),
            if (widget.isLoggedIn) // 로그인 상태에 따라 로그아웃 버튼 표시 여부를 설정
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("로그아웃"),
                onTap: () {
                  // 로그아웃 버튼 눌렀을 때의 동작 추가
                  // 로그아웃 기능을 실행하고, isLoggedIn 변수를 false로 설정
                  // 홈 페이지로 이동하며 이전 화면을 스택에서 제거
                  Navigator.of(context).pushReplacementNamed(
                    '/login',
                  );
                },
              ),
          ],
        ),
      ),
      body: const Center(
        child: Text("환영합니다!"),
      ),
    );
  }
}
