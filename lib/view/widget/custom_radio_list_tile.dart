import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T groupValue;
  final T value;
  final Function onChanged;
  final String title;
  final String subtitle;
  final Color activeColor;

  CustomRadioListTile({
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.title,
    this.subtitle,
    this.activeColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      isThreeLine: true,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: CustomText(
        text: title,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      subtitle: CustomText(
        text: subtitle,
      ),
      activeColor: activeColor,
    );
  }
}
