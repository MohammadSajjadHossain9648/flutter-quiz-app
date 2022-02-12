import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int marks;
  Result({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultState createState() => _ResultState(marks);
}

class _ResultState extends State<Result> {
  int marks;
  String message;
  String image;
  _ResultState(this.marks);
  List<String> images = [
    'images/bad.png',
    'images/good.png',
    'images/success.png'
  ];
  void initState() {
    super.initState();
    if (marks < 10) {
      image = images[0];
      message = 'You should try hard...\n' + 'You scored $marks';
    } else if (marks < 20) {
      image = images[1];
      message = 'You can do better...\n' + 'You scored $marks';
    } else {
      image = images[2];
      message = 'You did very well...\n' + 'You scored $marks';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: [
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Quando',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(
                  onPressed: null,
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.indigoAccent,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  splashColor: Colors.indigoAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
