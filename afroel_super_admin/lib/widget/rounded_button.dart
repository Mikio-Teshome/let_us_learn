import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.width,
      @required this.height,
      @required this.lable,
      this.onClick});
  final String lable;
  final double width;
  final double height;

  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        gradient: LinearGradient(
          colors: [Color(0xff7A6F4D), Color(0xff4B3D1F)],
        ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          onClick();
        },
        child: Text(
          lable,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 30),
        ),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
