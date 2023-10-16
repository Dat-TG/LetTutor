import 'package:flutter/material.dart';
import 'package:let_tutor/common/bottom_bar.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:let_tutor/presentation/welcome/welcome_screen.dart';
import 'package:let_tutor/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const BottomBar(),
    );
  }
}
