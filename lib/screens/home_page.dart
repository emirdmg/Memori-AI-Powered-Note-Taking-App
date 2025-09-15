import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:memori_ai/screens/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Notları state'te tut
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes(); // async fonksiyonu burada çağır
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? notesString = prefs.getString('notes');
    if (notesString != null) {
      final decoded = jsonDecode(notesString);
      if (mounted) {
        setState(() {
          _notes = List<Map<String, dynamic>>.from(decoded);
        });
      }
    } else {
      if (mounted) {
        setState(() => _notes = []);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'memori',
          style: TextStyle(
            fontFamily: 'PoiretOne',
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _notes.isEmpty
          ? const Center(child: Text('Henüz not yok'))
          : ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, i) {
          final n = _notes[i];
          return ListTile(
            title: Text(n['title'] ?? ''),
            subtitle: Text(
              n['body'] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () async {
              // Buradan düzenleme sayfasına gideceğiz (sonraki adım)
              // final changed = await Navigator.push(... AddNotePage(existingNote: n))
              // if (changed == true) _loadNotes();
            },
          );
        },
      ),
    );
  }
}
