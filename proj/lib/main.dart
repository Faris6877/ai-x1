import 'package:ai_x1/pages/chat_main_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black26,
          primaryColor: const Color.fromARGB(255, 0, 31, 30),
          cardColor: const Color.fromARGB(255, 0, 31, 30),
          primaryColorDark: const Color.fromARGB(255, 0, 31, 30),
          colorScheme:
              const ColorScheme.highContrastDark(background: Colors.amber),
          primarySwatch: Colors.amber),
      home: const ChatPage(),
    );
  }
}
