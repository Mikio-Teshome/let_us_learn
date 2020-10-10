import 'package:flutter/material.dart';
import 'package:let_us_learn/main.dart';
import 'package:let_us_learn/screen/home_view.dart';
import 'package:let_us_learn/screen/sign_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/second':
        // Validation of correct data type
        if (args == "true") {
          return MaterialPageRoute(
            builder: (_) => HomeView(),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => SignIn(),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
