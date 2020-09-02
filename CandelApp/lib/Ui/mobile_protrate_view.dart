import 'package:CandelApp/enums/candles.dart';
import 'package:CandelApp/widgets/app_bar.dart';
import 'package:CandelApp/widgets/candle.dart';
import 'package:CandelApp/widgets/constants.dart';
import 'package:CandelApp/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileProtrate extends StatefulWidget {
  @override
  _MobileProtrate createState() => _MobileProtrate();
}
class _MobileProtrate extends State<MobileProtrate> {

  CandleType SelectedCandle = CandleType.Candle1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyAppBar(
            font: 32,
            space: 30,
            Flex: 3,
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Message(
                  Verspace: 4.0,
                )),
          ),
          Expanded(
            flex: 5,
            child: Candle(
              langIconClick: () {},
              candleIconClick: (){

                setState(() {

                  SelectedCandle = SelectedCandle == CandleType.Candle1
                      ? CandleType.Candle2
                      : CandleType.Candle1;

                });
              },
              aboutIconClick: (){},
              IconSize: 60,
              iconRes: 40,
              SelectedCandle: SelectedCandle,

            ),
          )
        ],
      ),
    );
  }
}
