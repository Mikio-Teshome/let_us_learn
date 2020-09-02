import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.iconSize, @required this.size, @required this.icon, this.onClick});
  final IconData icon;
  final double size;
  final double iconSize;

  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onClick();
      },
      child: Icon(
        icon,
        size: iconSize,
      ),
      constraints: BoxConstraints.tightFor(
        width: size,
        height: size,
      ),
      elevation: 6.0,
      fillColor: Color(0xFF1B1B1B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
