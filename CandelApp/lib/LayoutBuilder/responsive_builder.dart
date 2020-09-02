import 'package:CandelApp/LayoutBuilder/sizing_information.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizingInformation = SizingInformation();
    return builder(context, sizingInformation);
  }
}