import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imageAsset;
  final String title;
  final IconData iconData;
  final Function onTap;

  CustomListTile({this.imageAsset, this.title, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imageAsset),
      title: CustomText(
        text: title,
        fontSize: 18.0,
      ),
      trailing: Icon(
        iconData,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}
