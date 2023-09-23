import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Share extends StatefulWidget {
  final bool isLoggedIn; // 로그인 상태를 받을 변수

  const Share({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subContentController = TextEditingController();
  final TextEditingController _mainContentController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // 글 목록을 저장할 리스트
  final List<Article> articles = [];

  void _shareArticle() {
    final title = _titleController.text;
    final subContent = _subContentController.text;
    final mainContent = _mainContentController.text;
    final writer = _writerController.text;
    final content = _contentController.text;
    final contact = _contactController.text;
    final address = _addressController.text;

    if (title.isNotEmpty &&
        subContent.isNotEmpty &&
        mainContent.isNotEmpty &&
        writer.isNotEmpty &&
        content.isNotEmpty &&
        contact.isNotEmpty &&
        address.isNotEmpty) {
      // 데이터를 Article 객체로 묶어서 리스트에 추가
      final article = Article(
        title: title,
        subContent: subContent,
        mainContent: mainContent,
        writer: writer,
        content: content,
        contact: contact,
        address: address,
      );

      setState(() {
        articles.add(article);
      });

      // 입력 필드 초기화
      _titleController.clear();
      _subContentController.clear();
      _mainContentController.clear();
      _writerController.clear();
      _contentController.clear();
      _contactController.clear();
      _addressController.clear();

      // 작성 완료 메시지 또는 다른 동작을 추가하세요.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('글이 작성 되었습니다.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('모든 필드를 작성해주세요.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("글 공유"),
      ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "글 제목",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: "글 제목을 입력하세요.",
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // 나머지 입력 필드들을 추가하세요.
                  const Text(
                    "부 제목",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _subContentController,
                    decoration: const InputDecoration(
                      hintText: "부 제목을 입력하세요.",
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "본문",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _mainContentController,
                    decoration: const InputDecoration(
                      hintText: "본문을 입력하세요.",
                    ),
                    maxLines: null, // 다중 라인 입력 활성화
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "글쓴이",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _writerController,
                    decoration: const InputDecoration(
                      hintText: "글쓴이를 입력하세요.",
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "내용",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      hintText: "내용을 입력하세요.",
                    ),
                    maxLines: null, // 다중 라인 입력 활성화
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "연락처",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _contactController,
                    decoration: const InputDecoration(
                      hintText: "연락처를 입력하세요.",
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "주소",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      hintText: "주소를 입력하세요.",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _shareArticle,
                child: const Text("확인"),
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                "작성된 글 목록",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            // 작성된 글 목록을 리스트뷰로 표시
            // 작성된 글 목록을 ListView로 표시
            ListView.builder(
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: [
                              Text(article.title),
                              Text(article.contact),
                              Text(article.address),
                              Text(article.writer),
                              Text(article.mainContent),
                            ],
                          ),
                        ),
                        // 글의 제목 또는 필요한 정보를 여기에 표시할 수 있습니다.
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // "공유하기" 버튼을 눌렀을 때 지정한 URL을 공유
                                  const siteURL =
                                      "https://study-5573d.web.app/#/screen6";
                                  _launchURL(siteURL); // Launch the URL here
                                },
                                child: const Center(child: Text("공유하기")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch a URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Article {
  final String title;
  final String subContent;
  final String mainContent;
  final String writer;
  final String content;
  final String contact;
  final String address;

  Article({
    required this.title,
    required this.subContent,
    required this.mainContent,
    required this.writer,
    required this.content,
    required this.contact,
    required this.address,
  });
}
