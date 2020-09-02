import 'package:flutter/material.dart';

import 'constants.dart';

class Message extends StatelessWidget {
  Constants constants = Constants();

  Message({@required this.Verspace});

  final double Verspace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('images/abiy.png'),
              ),
            ),
            Expanded(
              flex: 8,
              child: Text(
                ' PM Dr.Abiy Ahmed',
                style: constants.style(
                  18,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Verspace,
        ),
        Text(
          'Message of the Year, Message of the Year Message of the Year Message of the Year Message of the Year Message of the Year Message of the Year, Message of the Year Message of the Year Message of the Year Message of the Year Message of the Year',
          style: constants.style(18),
        )
      ],
    );
  }
}
