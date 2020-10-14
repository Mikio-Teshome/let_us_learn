import 'package:flutter/material.dart';
import 'package:let_us_learn/screen/q_a.dart';
import 'package:let_us_learn/widget/rounded_button.dart';
import 'package:let_us_learn/widget/rounded_text_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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
  final Ques = TextEditingController();
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

  String Generee = "Select Genre";

  List<ListItem> _dropdownItems = [
    ListItem(1, "Select Genre"),
    ListItem(2, "Programming"),
    ListItem(2, "Physics"),
    ListItem(2, "Maths"),
    ListItem(2, "Chemistry"),
    ListItem(2, "Psychology"),
    ListItem(3, "Biology")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      "Question",
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: RoundedTextWidget(
                  hint: "Write Your Question here",
                  isPass: false,
                  obscure: false,
                  controller: Ques,
                  Validator: PhoneValidator,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        width: 1,
                        color: Color(0xFF0B6DCF),
                        style: BorderStyle.solid)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ListItem>(
                              value: _selectedItem,
                              style: TextStyle(
                                  color: Color(0xFF474747),
                                  fontFamily: 'ExtraLight',
                                  fontSize: 18.0),
                              items: _dropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                  Generee = _selectedItem.name;
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              lable: "Submit",
              width: 340,
              height: 60,
              onClick: () async {
                if (validator()) {
                  var url =
                      'https://learn.maledamotivation.com/learn/v1/askQuestion.php';
                  showAlertDialog(context);
                  var Response = await http.post(url, body: {
                    'userId': id,
                    'question': Ques.text,
                    'genere': Generee,
                  });
                  Navigator.pop(context);
                  if (Response.statusCode == 200) {
                    var response = convert.jsonDecode(Response.body);

                    if (response['error'] == false) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuesAnswer()));
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
