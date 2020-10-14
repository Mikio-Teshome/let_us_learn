import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextWidget extends StatelessWidget {
  RoundedTextWidget(
      {@required this.hint,
      @required this.isPass,
      this.icon,
      this.obscure,
      this.onclick,
      this.multiline,
      this.controller,
      @required this.Validator,
      this.PrefixIcon});

  final String hint;
  final bool obscure;
  final bool isPass;
  final bool multiline;
  final IconData icon;
  final IconData PrefixIcon;
  final Function onclick;
  final Function Validator;
  final TextEditingController controller;

  // final Input
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: multiline == false ? null : TextInputType.multiline,
        maxLines: multiline == false ? 1 : null,
        validator: Validator,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        controller: controller,
        obscureText: obscure,
        decoration: new InputDecoration(
          labelText: hint,
          // suffixIcon: isPass == true
          //     ? Icon(
          //         icon,
          //         color: Color(0xFF736746),
          //       )
          //     : Icon(null),
          prefixIcon: PrefixIcon == null
              ? null
              : Icon(
                  PrefixIcon,
                  color: Color(0xFF0B6DCF),
                ),
          suffixIcon: icon == null
              ? null
              : new GestureDetector(
                  onTap: onclick,
                  child: new Icon(
                    isPass == true ? icon : null,
                    color: Color(0xFF0B6DCF),
                  ),
                ),
          labelStyle: TextStyle(color: Colors.grey, fontFamily: 'ExtraLight'),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
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
