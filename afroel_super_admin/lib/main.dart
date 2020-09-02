import 'dart:async';

import 'package:afroel_super_admin/route_generator.dart';
import 'package:afroel_super_admin/screens/home_view.dart';
import 'package:afroel_super_admin/screens/sign_in.dart';
import 'package:afroel_super_admin/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF736746),
      scaffoldBackgroundColor: Color(0xFFffffff),
    ),
    home: new SplashScreen(),
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

// class Starter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Color(0xFF736746),
//         scaffoldBackgroundColor: Color(0xFFffffff),
//       ),
//       // routes: {
//       //   '/': (context) => SplashScreen(),
//       //   // ResultPage.routeName: (context) => ResultPage(),
//       // },
//       home: new SplashScreen(),
//       initialRoute: '/',
//       onGenerateRoute: RouteGenerator.generateRoute,
//     );
//   }
// }
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
        Navigator.of(context).pushNamed(
          '/second',
          arguments: "flase",
        );
      } else {
        Navigator.of(context).pushNamed(
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
        child: new Image.asset('images/art.png'),
      ),
    );
  }
}
