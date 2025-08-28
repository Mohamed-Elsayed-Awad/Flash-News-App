import 'package:flash_news/views/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(FlashNewsApp());
}

class FlashNewsApp extends StatelessWidget {
  FlashNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomeScreen(),
      ),
    );
  }
}
