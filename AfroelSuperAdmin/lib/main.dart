import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'views/starter.dart';
import 'widgets/common_widgets/rounded_text_input.dart';

void main() {
  runApp(AfroelSuperAdmin());
}

class AfroelSuperAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D21),
        scaffoldBackgroundColor: Color(0xFF0A0D21),
      ),
      routes: {
        '/': (context) => AppStarter(),
        // ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}