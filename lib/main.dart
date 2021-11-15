import 'package:flutter/material.dart';
import 'zmenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'IT 가이드',
      theme: ThemeData(),
      home: const MenuPage(title : 'IT 가이드'),
    );
  }
}