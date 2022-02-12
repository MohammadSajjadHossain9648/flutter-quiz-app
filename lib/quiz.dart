import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_test/result.dart';

class getJson extends StatelessWidget {
  String jsons;
  getJson(this.jsons);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsons),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                'loading...',
              ),
            ),
          );
        } else {
          return testPage(mydata: mydata);
        }
      },
    );
  }
}

class testPage extends StatefulWidget {
  var mydata;
  testPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _testPageState createState() => _testPageState(mydata);
}

class _testPageState extends State<testPage> {
  var mydata;
  _testPageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTime = '30';
  bool cancelTimer = false;

  Map<String, Color> buttonColor = {
    'a': Colors.indigoAccent,
    'b': Colors.indigoAccent,
    'c': Colors.indigoAccent,
    'd': Colors.indigoAccent,
  };

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        showTime = timer.toString();
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
      });
    });
  }

  void nextQuestion() {
    timer = 30;
    cancelTimer = false;
    setState(() {
      if (i < 6) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Result(marks: marks),
          ),
        );
      }
      buttonColor['a'] = colortoshow;
      buttonColor['b'] = colortoshow;
      buttonColor['c'] = colortoshow;
      buttonColor['d'] = colortoshow;
    });
    startTimer();
  }

  void checkAnswer(String o) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][o]) {
      marks = marks + 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      buttonColor[o] = colortoshow;
    });
    Timer(Duration(seconds: 2), nextQuestion);
  }

  Widget choiceButton(String o) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {
          checkAnswer(o);
        },
        child: Text(
          mydata[1][i.toString()][o],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'Alike',
          ),
          maxLines: 1,
        ),
        color: buttonColor[o],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('QuizTime'),
            content: Text('You can not go back.'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quando',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    choiceButton('a'),
                    choiceButton('b'),
                    choiceButton('c'),
                    choiceButton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    showTime,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
