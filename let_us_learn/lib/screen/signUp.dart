import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:let_us_learn/screen/home_view.dart';
import 'package:let_us_learn/widget/rounded_button.dart';
import 'package:let_us_learn/widget/rounded_text_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final Name = TextEditingController();
  final email = TextEditingController();
  final sex = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> store(
      {String FullName,
      String Phone,
      String Id,
      String Sex,
      String Email}) async {
    final SharedPreferences prefs = await _prefs;
    // final int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setString("FullName", FullName);
    prefs.setString("Phone", Phone);
    prefs.setString("Id", Id);
    prefs.setString("sex", Sex);
    prefs.setString("email", Email);
    prefs.setBool("SignedIn", true);
  }

  String Sexx = "Select Sex";
  String PhoneValidator(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  String confirmPassValidator(value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.toString() != password.text.toString()) {
      return "Passwords don't match!";
    } else {
      return null;
    }
  }

  String PassValidator(value) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    if (value.isEmpty) {
      return "Required";
    } else if (value.toString().length < 8) {
      return "The Password must be at least 8 character long";
    } else if (value.toString() == value.toString().toLowerCase()) {
      return "The Password must contain at least one Upper-Case character";
    } else if (value.toString() == value.toString().toUpperCase()) {
      return "The Password must contain at least one Lower-Case character";
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

  List<ListItem> _dropdownItems = [
    ListItem(1, "Select Sex"),
    ListItem(2, "Male"),
    ListItem(3, "Female")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

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

  bool obscuree = false;
  bool obscureee = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Image.asset(
              "images/logo.png",
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Create Account",
              style: TextStyle(
                fontFamily: 'PoppinsBold',
                fontSize: 24.0,
                color: Color(0xFF0B6DCF),
              ),
            ),
            Text(
              "Create a new account",
              style: TextStyle(
                fontFamily: 'ExtraLight',
                fontSize: 16.0,
                color: Color(0xFF7698B9),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedTextWidget(
                      hint: "Full Name",
                      PrefixIcon: Icons.perm_identity,
                      isPass: false,
                      obscure: false,
                      controller: Name,
                      Validator: PhoneValidator,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedTextWidget(
                      hint: "Email",
                      PrefixIcon: Icons.mail,
                      isPass: false,
                      obscure: false,
                      controller: email,
                      Validator: PhoneValidator,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1,
                              color: Color(0xFF0B6DCF),
                              style: BorderStyle.solid)),
                      child: Row(
                        children: [
                          Padding(
                            child: Icon(
                              Icons.wc,
                              color: Color(0xFF0B6DCF),
                            ),
                            padding: EdgeInsets.only(left: 12.0),
                          ),
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
                                        Sexx = _selectedItem.name;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedTextWidget(
                      hint: "Phone",
                      PrefixIcon: Icons.stay_current_portrait,
                      isPass: false,
                      obscure: false,
                      controller: phone,
                      Validator: PhoneValidator,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedTextWidget(
                      hint: "Password",
                      PrefixIcon: Icons.lock,
                      multiline: false,
                      isPass: true,
                      controller: password,
                      obscure: !obscuree,
                      Validator: PassValidator,
                      icon: obscuree == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onclick: () {
                        setState(() {
                          if (obscuree == false) {
                            obscuree = true;
                          } else {
                            obscuree = false;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedTextWidget(
                      hint: "Confirm Password",
                      PrefixIcon: Icons.lock,
                      multiline: false,
                      isPass: true,
                      controller: confirmPassword,
                      obscure: !obscureee,
                      Validator: confirmPassValidator,
                      icon: obscureee == false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onclick: () {
                        setState(() {
                          if (obscureee == false) {
                            obscureee = true;
                          } else {
                            obscureee = false;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      lable: "SIGNIN",
                      width: 340,
                      height: 60,
                      onClick: () async {
                        if (validator()) {
                          var url =
                              'https://learn.maledamotivation.com/learn/v1/SignUp.php';
                          showAlertDialog(context);
                          var Response = await http.post(url, body: {
                            'phone': phone.text,
                            'password': password.text,
                            'name': Name.text,
                            'sex': Sexx,
                            'email': email.text
                          });
                          Navigator.pop(context);
                          if (Response.statusCode == 200) {
                            var response = convert.jsonDecode(Response.body);

                            if (response['error'] == false) {
                              store(
                                  FullName: Name.text,
                                  Phone: phone.text,
                                  Id: response['id'],
                                  Email: email.text,
                                  Sex: Sexx);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            }
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account?",
                          style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontSize: 15.0,
                            color: Color(0xFF474747),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'PoppinsRegular',
                              fontSize: 15.0,
                              color: Color(0xFF0B6DCF),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed(
                                '/signIn',
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
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
