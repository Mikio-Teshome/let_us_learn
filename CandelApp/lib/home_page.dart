import 'package:CandelApp/Ui/Desktop_view.dart';
import 'package:CandelApp/Ui/mobile_landscape_view.dart';
import 'package:CandelApp/Ui/mobile_protrate_view.dart';
import 'package:flutter/material.dart';

import 'LayoutBuilder/orientation_layout.dart';
import 'LayoutBuilder/screen_typeLayout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileProtrate(),
        landscape: MobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: MobileProtrate(),
        landscape: MobileProtrate(),
      ),
      desktop: DesktopView()
    );
  }
}
