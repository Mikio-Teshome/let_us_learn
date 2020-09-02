import 'package:CandelApp/candle_icon_icons.dart';
import 'package:CandelApp/enums/candles.dart';
import 'package:CandelApp/lang_icon_icons.dart';
import 'package:CandelApp/widgets/rounded_icons.dart';
import 'package:flutter/material.dart';

class Candle extends StatelessWidget {

  Candle({@required this.langIconClick, @required this.candleIconClick, @required this.aboutIconClick,
      @required this.iconRes, @required this.IconSize, @required this.SelectedCandle});

  final Function langIconClick;
  final Function candleIconClick;
  final Function aboutIconClick;
  final double iconRes;
  final double IconSize;
  final CandleType SelectedCandle;

  static const String candle1 = 'images/Candle.gif';
  static const String candle2 = 'images/Candle2.gif';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1B1B1B),
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(40)),
                color: Color(0xff121212)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedIconButton(
                  icon: Lang_icon.langicon,iconSize: iconRes,size: IconSize,onClick: langIconClick,
                ),
                RoundedIconButton(
                  icon: Candle_icon.candle,iconSize: iconRes,size: IconSize,onClick: candleIconClick,
                ),
                RoundedIconButton(
                  icon: Icons.info_outline,iconSize: iconRes,size: IconSize,onClick: aboutIconClick,
                )
              ],
            ),
          ),
          Expanded(child: Image.asset(

              SelectedCandle == CandleType.Candle1
                  ? candle1
                  : candle2,)),
        ],
      ),
    );
  }


}
