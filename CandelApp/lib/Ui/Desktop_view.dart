import 'package:CandelApp/enums/candles.dart';
import 'package:CandelApp/widgets/app_bar.dart';
import 'package:CandelApp/widgets/candle.dart';
import 'package:CandelApp/widgets/constants.dart';
import 'package:CandelApp/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopView createState() => _DesktopView();
}

class _DesktopView extends State<DesktopView> {
  CandleType SelectedCandle = CandleType.Candle1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: [
                MyAppBar(
                  font: 52,
                  space: 30,
                  Flex: 1,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Candle(
                    langIconClick: () {},
                    candleIconClick: () {
                      setState(() {
                        SelectedCandle = SelectedCandle == CandleType.Candle1
                            ? CandleType.Candle2
                            : CandleType.Candle1;
                      });
                    },
                    aboutIconClick: () {},
                    IconSize: 80,
                    iconRes: 60,
                    SelectedCandle: SelectedCandle,
                  ),
                )
              ],

            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: SafeArea(
                  child: Message(
                    Verspace: 4.0,
                  ),
                )),
          ),

        ],
      ),
    );
  }
}
