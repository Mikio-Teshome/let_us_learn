import 'package:flutter/material.dart';

class QuestionPostCard extends StatelessWidget {
  final String QuestionTxt;
  final String userName;
  QuestionPostCard({this.QuestionTxt, this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          width: 50.0,
          height: 50.0,
          child: Center(
              child: Text(
            userName[0].toUpperCase(),
            style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              fontSize: 24.0,
              color: Colors.white,
            ),
          )),
          decoration: new BoxDecoration(
            color: Color(0xFF0B6DCF),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 4, right: 10, bottom: 20),
          width: 140,
          child: QuestionTxt == null
              ? null
              : Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      QuestionTxt,
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
