import 'package:flutter/material.dart';

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
    super.initState();
    void onChange(){
      final changed = _titleController.text.trim().isNotEmpty || _bodyController.text.trim().isNotEmpty;
      if (_hasChanged != changed) {
        setState(() => _hasChanged = changed);
      }
    }
    _titleController.addListener(onChange);
    _bodyController.addListener(onChange);

  }
  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Not"),
        actions: [
          if (_hasChanged)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: (){
                final title = _titleController.text.trim();
                final body  = _bodyController.text.trim();
                if (title.isEmpty && body.isEmpty) return;
                final note = {
                  'title': title,
                  'body': body,
                  'createdAt': DateTime.now().toIso8601String(),
                };
                Navigator.pop(context, note);
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık
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
      )
    );
  }
}
