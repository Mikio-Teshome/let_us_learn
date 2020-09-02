
import 'dart:async';

import 'package:AfroelSuperAdmin/LayoutBuilder/orientation_layout.dart';
import 'package:AfroelSuperAdmin/LayoutBuilder/screen_typeLayout.dart';
import 'package:AfroelSuperAdmin/views/mobile/splash_screen.dart';
import 'package:flutter/material.dart';

import 'web/home/home_view.dart';

class AppStarter extends StatefulWidget {
  @override
  _AppStarterState createState() => _AppStarterState();
}

class _AppStarterState extends State<AppStarter> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: SplashScreen(),
          landscape: SplashScreen(),
        ),
        tablet: OrientationLayout(
          portrait: HomeView(),
          landscape: HomeView(),
        ),
        desktop: HomeView()
    );
  }
}