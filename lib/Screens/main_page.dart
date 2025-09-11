import 'package:flutter/material.dart';
import 'package:memori_ai/Screens/profile_page.dart';
import 'package:memori_ai/templates/card_view.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notes', jsonEncode(notes));
  }
  void addNote(Map<String, dynamic> note){
    setState(() {
      notes.add(note);
    });
    _saveNotes();
  }

  List<Map<String, dynamic>> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'memori',
          style: TextStyle(
              fontFamily: 'PoiretOne',
              fontSize: 24
          ),
        ),
        actions: [IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
              icon: Icon(Icons.account_circle_outlined)
            ),],
      ),
      body: notes.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.grey.shade200
              ),
              child: Center(
                  child: Text(
                    '😴',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  )
              ),
            ),
            Text(
              'There is no content yet.',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600
              ),
            )
          ],
        ),
      )
          : Wrap(
        spacing: 8,
        runSpacing: 8,
        children: notes.map((n) => CardView(
          title: (n['title'] ?? '').toString(),
          body:  (n['body']  ?? '').toString(),
        )).toList(),
      )
    );
  }
}
