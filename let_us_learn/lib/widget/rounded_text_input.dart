import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextWidget extends StatelessWidget {
  RoundedTextWidget(
      {@required this.hint,
      @required this.isPass,
      this.icon,
      this.obscure,
      this.onclick,
      this.controller,
      @required this.Validator});

  final String hint;
  final bool obscure;
  final bool isPass;
  final IconData icon;
  final Function onclick;
  final Function Validator;
  final TextEditingController controller;

  // final Input
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: Validator,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        controller: controller,
        obscureText: obscure,
        inputFormatters: isPass == false
            ? [FilteringTextInputFormatter.allow(RegExp('[+0-9]'))]
            : null,
        decoration: new InputDecoration(
          labelText: hint,
          // suffixIcon: isPass == true
          //     ? Icon(
          //         icon,
          //         color: Color(0xFF736746),
          //       )
          //     : Icon(null),
          suffixIcon: new GestureDetector(
            onTap: onclick,
            child: new Icon(
              isPass == true ? icon : null,
              color: Color(0xFF736746),
            ),
          ),
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF736746), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF736746), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF736746), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
