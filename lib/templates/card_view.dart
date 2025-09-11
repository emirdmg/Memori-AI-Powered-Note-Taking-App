import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  String _clip(String s, int n) => s.length <= n ? s : '${s.substring(0, n)}...';

  @override
  Widget build(BuildContext context) {
    final t = _clip(widget.title, 10);
    final b = _clip(widget.body, 20);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Material(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {},
            onLongPress: () {},
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          t, // 10 karaktere kırpılmış başlık
                          style: const TextStyle(fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          b, // 20 karaktere kırpılmış içerik
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
