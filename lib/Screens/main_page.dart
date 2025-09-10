import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              onPressed: (){},
              icon: Icon(Icons.account_circle_outlined)
            ),],
      ),
      body: Center(
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
      ),
    );
  }
}
