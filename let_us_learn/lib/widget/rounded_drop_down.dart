import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget(
      {@required this.hint,
      @required this.isPass,
      this.OnChange,
      this.obscure,
      this.onclick,
      this.controller,
      @required this.Validator,
      this.PrefixIcon});

  final String hint;
  final bool obscure;
  final bool isPass;
  final IconData PrefixIcon;
  final Function onclick;
  final Function Validator;
  final Function OnChange;
  final TextEditingController controller;
  var _currencies = [
    "Male",
    "Female",
  ];
  String _currentSelectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: hint,
              prefixIcon: Icon(
                PrefixIcon,
                color: Color(0xFF0B6DCF),
              ),
              labelStyle:
                  TextStyle(color: Colors.grey, fontFamily: 'ExtraLight'),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF0B6DCF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _currentSelectedValue,
                isDense: true,
                onChanged: OnChange,
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
