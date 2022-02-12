import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_test/home.dart';
import './home.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer((Duration(seconds: 3)), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Text(
          'QuizTime',
          style: TextStyle(
            fontSize: 60.0,
            fontFamily: 'Satisfy',
          ),
        ),
      ),
    );
  }
}
