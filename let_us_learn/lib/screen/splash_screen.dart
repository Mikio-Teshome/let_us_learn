import 'dart:async';

import 'package:flutter/material.dart';
import 'package:let_us_learn/screen/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> isSignedIn() async {
    final SharedPreferences prefs = await _prefs;
    final bool SignedIn = (prefs.getBool('SignedIn') ?? false);
    return SignedIn;
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));

    // Timer(Duration(seconds: 3), () {
    //   if (isSignedIn() != null) {
    //     if (isSignedIn() == true) {
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => HomeView()));
    //     } else {
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => SignIn()));
    //     }
    //   } else {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => SignIn()));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Center(child: Image.asset("images/art.png")),
      ),
    );
  }
}
