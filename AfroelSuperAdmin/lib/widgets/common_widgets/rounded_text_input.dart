import 'package:flutter/material.dart';

class RoundedTextWidget extends StatelessWidget {
  RoundedTextWidget({this.hint, this.isPass});

  final String hint;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        obscureText: isPass,
        decoration: new InputDecoration(
          labelText: hint,
          suffixIcon: isPass == true ? Icon(Icons.visibility_off):Icon(null),
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF736746), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF736746), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
