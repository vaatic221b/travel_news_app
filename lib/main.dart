import 'package:flutter/material.dart';
import 'package:travel_news_app/screens/home.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Travel News App - Midterm Sucalit',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );

  }
}
