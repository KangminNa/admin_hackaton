import 'package:flutter/material.dart';

class Memo extends StatefulWidget {
  final bool isLoggedIn; // 로그인 상태를 받을 변수

  const Memo({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  _MemoState createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final List<MemoItem> memos = []; // 메모 아이템을 저장할 리스트

  void _addMemo() {
    final title = _titleController.text;
    final writer = _writerController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && writer.isNotEmpty && content.isNotEmpty) {
      setState(() {
        memos.add(MemoItem(title, writer, content));
        // 입력 필드 초기화
        _titleController.clear();
        _writerController.clear();
        _contentController.clear();
      });
    }
  }

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
              leading: const Icon(Icons.home),
              title: const Text("홈"),
              onTap: () {
                // 메모 버튼 눌렀을 때의 동작 추가
                // 예를 들어, 메모 페이지로 이동하는 코드를 여기에 추가
                Navigator.of(context).pushReplacementNamed(
                  '/home',
                );
              },
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
                ); // 메뉴를 닫습니다.
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
      body: Column(
        children: [
          SizedBox(
            width: 600,
            height: 400,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: "제목",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _writerController,
                    decoration: const InputDecoration(
                      labelText: "작성자",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _contentController,
                        decoration: const InputDecoration(
                          labelText: "내용",
                        ),
                        maxLines: null, // 다중 라인 입력을 활성화
                        maxLength: 500, // 최대 500자 입력 제한
                      ),
                      // 문자 수 카운트 표시
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 300.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _addMemo,
                  child: const Text("제출"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                final memo = memos[index];
                return Card(
                  margin: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(memo.title),
                    subtitle: Text("작성자: ${memo.writer}\n${memo.content}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MemoItem {
  final String title;
  final String writer;
  final String content;

  MemoItem(this.title, this.writer, this.content);
}
