import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:let_us_learn/screen/home_view.dart';
import 'package:let_us_learn/widget/rounded_button.dart';
import 'package:let_us_learn/widget/rounded_text_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool obscuree = false;
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final password = TextEditingController();

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

  Future<void> store({String FullName, String Phone, String Id}) async {
    final SharedPreferences prefs = await _prefs;
    // final int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setString("FullName", FullName);
    prefs.setString("Phone", Phone);
    prefs.setString("Id", Id);
    prefs.setBool("SignedIn", true);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Image.asset(
              "images/logo.png",
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(
              height: 60.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'SignIn',
                  style: TextStyle(
                    color: Color(0xFF736746),
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedTextWidget(
                      hint: "Phone",
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
                      isPass: true,
                      controller: password,
                      obscure: !obscuree,
                      Validator: PhoneValidator,
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: RoundedButton(
                  lable: "SignIn",
                  width: 135,
                  height: 50,
                  onClick: () async {
                    if (validator()) {
                      var url = 'http://192.168.137.1/afroel/v1/signIn.php';
                      showAlertDialog(context);
                      var Response = await http.post(url, body: {
                        'phone': phone.text,
                        'password': password.text
                      });
                      Navigator.pop(context);
                      if (Response.statusCode == 200) {
                        var response = convert.jsonDecode(Response.body);

                        store(
                            FullName:
                                response['f_name'] + " " + response['l_name'],
                            Phone: response['phone_no'],
                            Id: response['id']);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
