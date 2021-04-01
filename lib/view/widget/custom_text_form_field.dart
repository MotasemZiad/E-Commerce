import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isSecured;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final Function onSaved;
  final Function validator;
  CustomTextFormField({
    this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    this.isSecured = false,
    this.textStyle,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: textStyle,
        obscureText: isSecured,
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: kGreyColor),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
