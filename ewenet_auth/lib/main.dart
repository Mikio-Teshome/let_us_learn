import 'package:ewenet_auth/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.light().copyWith(
      primaryColor: Color(0xFF0B6DCF),
      scaffoldBackgroundColor: Color(0xFFffffff),
    ),
    home: new LogIn(),
  ));
}
