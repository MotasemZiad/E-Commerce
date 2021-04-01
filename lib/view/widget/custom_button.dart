import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color textColor;
  final Color color;

  CustomButton({
    this.text,
    @required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kButtonBorderRadius),
        ),
        color: color,
        colorBrightness: Brightness.dark,
        padding: EdgeInsets.all(15),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: textColor,
          alignment: Alignment.center,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
