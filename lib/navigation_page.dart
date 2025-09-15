import 'package:flutter/material.dart';
import 'package:memori_ai/screens/add_note_page.dart';
import 'package:memori_ai/screens/home_page.dart';
import 'package:memori_ai/screens/profile_page.dart';
import 'package:memori_ai/screens/search_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class GoogleBottomBar extends StatefulWidget {
  const GoogleBottomBar({super.key});

  @override
  State<GoogleBottomBar> createState() => _GoogleBottomBarState();
}

class _GoogleBottomBarState extends State<GoogleBottomBar> {
  final bool shouldShowNavbar = true;
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AddNotePage(),
    const SearchPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: shouldShowNavbar ? SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: _navBarItems,
      ) : null,
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.add_circle),
    title: const Text("Add Note"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profile"),
    selectedColor: Colors.teal,
  ),
];
