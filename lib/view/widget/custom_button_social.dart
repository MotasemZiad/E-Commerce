import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageAsset;

  CustomButtonSocial({this.text, this.imageAsset, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(kButtonBorderRadius),
          color: Colors.grey.shade100,
        ),
        child: FlatButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(
                imageAsset,
                width: 20.0,
                height: 20.0,
              ),
              SizedBox(
                width: 90.0,
              ),
              CustomText(
                text: text,
                fontSize: 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
