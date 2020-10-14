import 'dart:async';

import 'package:flutter/material.dart';
import 'package:let_us_learn/route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.light().copyWith(
      primaryColor: Color(0xFF0B6DCF),
      scaffoldBackgroundColor: Color(0xFFffffff),
    ),
    home: new SplashScreen(),
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void navigationPage() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      final bool signedin = (prefs.getBool("SignedIn"));
      if (signedin == null) {
        Navigator.of(context).pushReplacementNamed(
          '/second',
          arguments: "flase",
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          '/second',
          arguments: signedin.toString(),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Let's Learn",
              style: TextStyle(
                color: Color(0xFF0B6DCF),
                fontFamily: 'PoppinsSemiBold',
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
