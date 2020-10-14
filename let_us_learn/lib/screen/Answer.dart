import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_us_learn/Services/AesServices.dart';
import 'package:let_us_learn/models/AesPosts.dart';
import 'package:let_us_learn/screen/q_a.dart';
import 'package:let_us_learn/screen/question.dart';
import 'package:let_us_learn/widget/ques_posts.dart';
import 'package:let_us_learn/widget/rounded_text_input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../argss.dart';

class Answer extends StatefulWidget {
  Answer({this.ques_id});
  final String ques_id;
  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  List<AesPosts> posts;
  bool loading;
  String Ques, quesId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final args = ModalRoute.of(context).settings.arguments;
        ScreenArguments argument = args;
        Ques = argument.quesTxt;
        quesId = argument.quesId;
        AesServices.getQuesPosts(id: argument.quesId).then((lists) {
          setState(() {
            posts = lists;
            loading = false;
          });
        });
      });
    });
    getId();
  }

  String PhoneValidator(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  bool validator() {
    if (_formKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String id;
  Future<String> getId() async {
    final SharedPreferences prefs = await _prefs;
    final String idd = await (prefs.getString("Id"));
    setState(() => id = idd);
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 10), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final Queess = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF0B6DCF),
                          size: 32.0,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Q&A",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 26.0,
                        color: Color(0xFF0B6DCF),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32.0,
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                color: Color(0xffCEE2F6),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    Ques,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 18.0,
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                child: posts == null
                    ? new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("")),
                        ],
                      )
                    : ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          AesPosts post = posts[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuesAnswer(),
                                    ));
                              });
                            },
                            child: QuestionPostCard(
                              QuestionTxt: post.answer,
                              userName: post.userName,
                            ),
                          );
                        },
                      ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Form(
                          key: _formKey,
                          child: RoundedTextWidget(
                            hint: "Write Your Answer here",
                            isPass: false,
                            obscure: false,
                            controller: Queess,
                            Validator: PhoneValidator,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Color(0xFF0B6DCF),
                      ),
                      onPressed: () {
                        setState(() async {
                          if (validator()) {
                            var url =
                                'https://learn.maledamotivation.com/learn/v1/askQuestion.php';
                            showAlertDialog(context);
                            var Response = await http.post(url, body: {
                              'userId': quesId,
                              'questionId': quesId,
                              'answer': Queess.text,
                            });
                            Navigator.pop(context);
                            if (Response.statusCode == 200) {
                              var response = convert.jsonDecode(Response.body);

                              if (response['error'] == false) {
                                AesServices.getQuesPosts(id: quesId)
                                    .then((lists) {
                                  setState(() {
                                    posts = lists;
                                    loading = false;
                                  });
                                });
                              }
                            }
                          }
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
