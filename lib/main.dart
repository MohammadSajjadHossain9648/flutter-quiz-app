import 'package:flutter/material.dart';
import './welcome.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizTime',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: welcomeScreen(),
    );
  }
}
