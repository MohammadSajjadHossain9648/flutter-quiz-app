import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './quiz.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> images = [
    'images/py.png',
    'images/java.png',
    'images/js.png',
    'images/cpp.png',
    'images/linux.png'
  ];
  List<String> json = [
    'assets/python.json',
    'assets/java.json',
    'assets/js.json',
    'assets/cpp.json',
    'assets/linux.json'
  ];
  Widget customCard(String langName, String image, String jsons) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => getJson(jsons),
            ),
          );
        },
        child: Material(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 10.0,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langName,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: 'Quando',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'this is some random question for ' +
                        langName +
                        '. It will takes 150 seconds to complete. Take the quiz and test yourself.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Alike',
                      color: Colors.white,
                    ),
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizTime'),
      ),
      body: Column(
        children: [
          customCard('Python', images[0], json[0]),
          customCard('Java', images[1], json[1]),
          customCard('Js', images[2], json[2]),
          customCard('C++', images[3], json[3]),
          customCard('Linux', images[4], json[4])
        ],
      ),
    );
  }
}
