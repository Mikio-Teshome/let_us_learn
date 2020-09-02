import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Expanded(
        child: Text(
          "HI there MIKI",
          style: TextStyle(color: Colors.red),
        ),
      ),
    ));
  }
}
