import 'package:flutter/material.dart';
import 'package:memori_ai/navigation_page.dart';
import 'package:memori_ai/screens/login_page.dart';
import 'package:memori_ai/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}


