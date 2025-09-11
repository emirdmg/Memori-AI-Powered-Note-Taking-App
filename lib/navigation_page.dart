import 'package:flutter/material.dart';
import 'package:memori_ai/Screens/main_page.dart';
import 'package:memori_ai/Screens/settings_page.dart';
import 'package:memori_ai/Screens/add_note_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _currentIndex = 0;

  final GlobalKey<MainPageState> _mainKey = GlobalKey<MainPageState>();
  late final List<Widget> _pages = [
    MainPage(key: _mainKey),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? _pages[0] : _pages[1],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add Note'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
          onTap: (index) async {
            if (index == 1) {
              // Add Note sayfasını aç ve sonucu "aynı scope" içinde al
              final result = await Navigator.push<Map<String, dynamic>?>(
                context,
                MaterialPageRoute(builder: (_) => const AddNotePage()),
              );

              // Sonuç geldiyse ana sayfadaki listeye ekle
              if (result != null) {
                _mainKey.currentState?.addNote(result); // NOT: addNote'un Map alacak (aşağıdaki uyarı)
              }
              return; // Home'da kal
            }

            // 0 -> Home, 2 -> Settings
            setState(() {
              _currentIndex = (index == 2) ? 1 : 0;
            });
          }
      ),
    );
  }
}
