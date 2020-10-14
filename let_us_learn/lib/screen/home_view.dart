import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_us_learn/Services/QesServices.dart';
import 'package:let_us_learn/Services/Services.dart';
import 'package:let_us_learn/Services/VideoServices.dart';
import 'package:let_us_learn/models/QesPosts.dart';
import 'package:let_us_learn/models/posts.dart';
import 'package:let_us_learn/screen/Books.dart';
import 'package:let_us_learn/screen/VideoPlayer.dart';
import 'package:let_us_learn/screen/Videos.dart';
import 'package:let_us_learn/screen/pdf_view.dart';
import 'package:let_us_learn/screen/q_a.dart';
import 'package:let_us_learn/widget/post_widget.dart';
import 'package:let_us_learn/widget/ques_posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../argss.dart';
import 'Answer.dart';
import 'games.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  List<Post> posts;
  List<Post> Vidposts;
  List<QesPosts> Qposts;
  bool loading;
  AnimationController animationController;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name();
    loading = true;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    Services.getPosts().then((list) {
      setState(() {
        posts = list;
        loading = false;
      });
    });
    VideoServices.getPosts().then((list) {
      setState(() {
        Vidposts = list;
        loading = false;
      });
    });
    QesServices.getQuesPosts().then((lists) {
      setState(() {
        Qposts = lists;
        loading = false;
      });
    });
  }

  String NaMel;
  Future<String> Name() async {
    final SharedPreferences prefs = await _prefs;
    final String name = await (prefs.getString("FullName"));
    setState(() => NaMel = name);
  }

  void Tooggle() {
    if (image == "images/menuIcon.png") {
      image = "images/close.png";
    } else {
      image = "images/menuIcon.png";
    }
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }

  final double maxSlide = 225.0;
  String image = "images/menuIcon.png";

  @override
  Widget build(BuildContext context) {
    var myDrawer = Scaffold(
      backgroundColor: Color(0xFF0B6DCF),
      body: Column(
        children: [
          SizedBox(height: 80.0),
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: 50.0,
                height: 50.0,
                child: Center(
                    child: Text(
                  NaMel == null ? "" : NaMel[0].toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 24.0,
                    color: Color(0xFF0B6DCF),
                  ),
                )),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              SizedBox(
                width: 130.0,
                child: Text(
                  NaMel == null ? "" : NaMel,
                  style: TextStyle(
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 21.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Tooggle();
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Books(),
                          ));
                    },
                    child: Text(
                      "Books",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Videos(),
                          ));
                    },
                    child: Text(
                      "Video",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuesAnswer(),
                          ));
                    },
                    child: Text(
                      "Q&A",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ));
                    },
                    child: Text(
                      "Game",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Tooggle();
                    },
                    child: Text(
                      "About",
                      style: TextStyle(
                        fontFamily: 'PoppinsSemiBold',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // var mychild =
    return AnimatedBuilder(
      builder: (context, _) {
        double slide = maxSlide * animationController.value;
        double scale = 1 - (animationController.value * 0.3);
        return Stack(
          children: [
            myDrawer,
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.centerLeft,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: Tooggle,
                                child: Image.asset(
                                  image,
                                  width: 33.0,
                                  height: 33.0,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Let's Learn",
                              style: TextStyle(
                                fontFamily: 'PoppinsSemiBold',
                                fontSize: 26.0,
                                color: Color(0xFF0B6DCF),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Books",
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontSize: 20.0,
                              color: Color(0xFF0B6DCF),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
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
                                shrinkWrap: true,
                                itemCount: posts.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Post post = posts[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PdfViewer(),
                                              settings: RouteSettings(
                                                arguments: post.pdfUrl,
                                              ),
                                            ));
                                      });
                                    },
                                    child: PostCard(
                                      link: post.imageUrl,
                                    ),
                                  );
                                  //   ListTile(
                                  //   title: Text(
                                  //     post.title,
                                  //     style: TextStyle(color: Colors.green),
                                  //   ),
                                  //   subtitle: Text(
                                  //     post.body,
                                  //     style: TextStyle(color: Colors.green),
                                  //   ),
                                  // );
                                },
                              ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Videos",
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontSize: 20.0,
                              color: Color(0xFF0B6DCF),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Vidposts == null
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
                                shrinkWrap: true,
                                itemCount: Vidposts.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Post post = Vidposts[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayy(),
                                              settings: RouteSettings(
                                                arguments: post.pdfUrl,
                                              ),
                                            ));
                                      });
                                    },
                                    child: PostCard(
                                      link: post.imageUrl,
                                    ),
                                  );
                                  //   ListTile(
                                  //   title: Text(
                                  //     post.title,
                                  //     style: TextStyle(color: Colors.green),
                                  //   ),
                                  //   subtitle: Text(
                                  //     post.body,
                                  //     style: TextStyle(color: Colors.green),
                                  //   ),
                                  // );
                                },
                              ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Q&A",
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontSize: 20.0,
                              color: Color(0xFF0B6DCF),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Qposts == null
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
                                itemCount: Qposts.length,
                                itemBuilder: (context, index) {
                                  QesPosts post = Qposts[index];
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      animation: animationController,
    );
  }
}
