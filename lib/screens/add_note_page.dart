import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:memori_ai/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool _hasChanged = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void onChange (){
      final changed = _titleController.text.trim().isNotEmpty || _bodyController.text.trim().isNotEmpty;
      if (_hasChanged != changed){
        setState(() => _hasChanged = changed);
      }
    }
    _titleController.addListener(onChange);
    _bodyController.addListener(onChange);
  }

  @override
  void dispose(){
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        actions: [
          if (_hasChanged)...[
            IconButton(
              icon: SvgPicture.asset("assets/icons/save_filled_icon_199726.svg", width: 26, height: 26,),
              onPressed: () async {
                final title = _titleController.text.trim();
                final body = _bodyController.text.trim();
                if (title.isEmpty && body.isEmpty) return;
                final note = {
                  'id': '1737009123456',
                  'title': '...',
                  'body': '...',
                  'createdAt': '2025-09-15T12:34:56.000Z',
                  'updatedAt': '2025-09-15T12:40:00.000Z'
                };
                final prefs = await SharedPreferences.getInstance();

                final String? notesString = prefs.getString('notes');
                List notes = notesString != null ? jsonDecode(notesString) : [];
                
                notes.add(note);

                await prefs.setString('notes', jsonEncode(notes));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/save_arrow_right_filled_icon_201934.svg"),
              onPressed: () async {
                final title = _titleController.text.trim();
                final body = _bodyController.text.trim();
                if (title.isEmpty && body.isEmpty) return;
                final note = {
                  'id': '1737009123456',
                  'title': '...',
                  'body': '...',
                  'createdAt': '2025-09-15T12:34:56.000Z',
                  'updatedAt': '2025-09-15T12:40:00.000Z'
                };
                final prefs = await SharedPreferences.getInstance();

                final String? notesString = prefs.getString('notes');
                List notes = notesString != null ? jsonDecode(notesString) : [];

                notes.add(note);

                await prefs.setString('notes', jsonEncode(notes));

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
          ]
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Başlık",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              textInputAction: TextInputAction.next,
              maxLines: 1,
            ),
            const SizedBox(height: 8),

            // İçerik
            Expanded(
              child: TextField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  hintText: "Notunu yaz...",
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 18),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
