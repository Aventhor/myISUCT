import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => navigationPage()
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/isuct_logo.png", width: 150.0, height: 150.0),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Мой ИГХТУ", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                        ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),),
                  Padding(padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "Все для студентов\nи их преподавателей",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ),
    );
  }
}