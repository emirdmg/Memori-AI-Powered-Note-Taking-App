import 'package:flutter/material.dart';
import 'package:memori_ai/Screens/main_page.dart';
import 'package:memori_ai/navigation_page.dart';

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
      home: NavigationPage(),
    );
  }
}


