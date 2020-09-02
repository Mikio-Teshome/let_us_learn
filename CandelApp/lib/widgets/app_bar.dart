import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  MyAppBar({@ required this.Flex,@ required this.space,@ required this.font});
  final int Flex;
  final double space;
  final double font;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: Flex,
              child: Container(
                child: Image.asset("images/ewenet.png"),
              )),
          SizedBox(
            width: space,
          ),
          Expanded(
              flex: 7,
              child: Text(
                'እንደ ሻማ',
                style: TextStyle(
                  fontFamily: 'yebse',
                  fontSize: font,
                ),
              )),
        ],
      ),
    );
  }


}
