import 'package:flutter/material.dart';
import 'package:let_us_learn/Services/Services.dart';
import 'package:let_us_learn/models/posts.dart';
import 'package:let_us_learn/screen/pdf_view.dart';
import 'package:let_us_learn/widget/post_widget.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  List<Post> posts;
  bool loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    Services.getPosts().then((list) {
      setState(() {
        posts = list;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Books",
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
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: posts == null
                    ? null
                    : List.generate(posts.length, (index) {
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
                      }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
