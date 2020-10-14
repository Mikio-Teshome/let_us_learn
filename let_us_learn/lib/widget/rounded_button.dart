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
          colors: [Color(0xff0B6DCF), Color(0xff003BA1)],
        ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          onClick();
        },
        child: Text(
          lable,
          style: TextStyle(
              fontFamily: 'PoppinsMedium', fontSize: 26, color: Colors.white),
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
