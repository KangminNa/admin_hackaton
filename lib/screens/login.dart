import 'package:admin_hackaton/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 더미 데이터로 이메일과 비밀번호를 저장
  final Map<String, String> dummyUserData = {
    "user1@example.com": "11111111",
    "user2@example.com": "22222222",
    "user3@example.com": "33333333",
  };

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // 이메일과 비밀번호 검증
    if (dummyUserData.containsKey(email) && dummyUserData[email] == password) {
      // 로그인 성공 시 홈 페이지로 이동하고 로그인 상태를 전달
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(isLoggedIn: true), // 로그인 상태 전달
        ),
      );
    } else {
      // 로그인 실패 시 에러 처리
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("로그인 실패"),
          content: const Text("이메일 또는 비밀번호가 올바르지 않습니다."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("확인"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            '수도주도',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          Center(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "이메일",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: "비밀번호",
                      ),
                      obscureText: true,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text("로그인"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      // "만든이들" 버튼을 눌렀을 때 지정한 URL로 이동
                      const siteURL =
                          "https://seonghwan1101.github.io/hacker/Team.html";
                      _launchURL(siteURL); // Launch the URL here
                    },
                    child: const Text(
                      "만든이들 구경가기",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
