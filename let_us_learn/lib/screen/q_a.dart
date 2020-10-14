import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_us_learn/Services/QesServices.dart';
import 'package:let_us_learn/argss.dart';
import 'package:let_us_learn/models/QesPosts.dart';
import 'package:let_us_learn/screen/Answer.dart';
import 'package:let_us_learn/screen/question.dart';
import 'package:let_us_learn/widget/ques_posts.dart';

class QuesAnswer extends StatefulWidget {
  @override
  _QuesAnswerState createState() => _QuesAnswerState();
}

class _QuesAnswerState extends State<QuesAnswer> {
  List<QesPosts> posts;
  bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QesServices.getQuesPosts().then((lists) {
      setState(() {
        posts = lists;
        loading = false;
      });
    });
  }

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
                          QesPosts post = posts[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Answer(),
                                      settings: RouteSettings(
                                        arguments: ScreenArguments(
                                            quesId: post.id,
                                            quesTxt: post.question),
                                      ),
                                    ));
                              });
                            },
                            child: QuestionPostCard(
                              QuestionTxt: post.question,
                              userName: post.userName,
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Question(),
                ));
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
