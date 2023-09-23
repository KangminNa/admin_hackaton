import 'package:admin_hackaton/screens/chatting.dart';
import 'package:admin_hackaton/screens/help.dart';
import 'package:admin_hackaton/screens/home.dart';
import 'package:admin_hackaton/screens/memo.dart';
import 'package:admin_hackaton/screens/sharing.dart';

import 'package:flutter/material.dart';
import 'package:admin_hackaton/screens/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/memo': (context) => const Memo(
              isLoggedIn: true,
            ),
        '/help': (context) => const Help(
              isLoggedIn: true,
            ),
        '/home': (context) => const Home(
              isLoggedIn: true,
            ),
        '/chatting': (context) => const Chatting(
              isLoggedIn: true,
            ),
        '/share': (context) => const Share(
              isLoggedIn: true,
            ),
      },
    );
  }
}
