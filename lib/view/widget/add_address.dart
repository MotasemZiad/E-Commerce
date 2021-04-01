import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(kPaddingContent),
        child: Column(
          children: [
            SizedBox(
              height: 42.0,
            ),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              activeColor: kPrimaryColor,
              title: CustomText(
                  text: 'Billing address is the same as delivery address'),
            ),
            SizedBox(
              height: 38.0,
            ),
            CustomTextFormField(
              labelText: 'Street 1',
            ),
            SizedBox(
              height: 38.0,
            ),
            CustomTextFormField(
              labelText: 'Street 1',
            ),
            SizedBox(
              height: 38.0,
            ),
            CustomTextFormField(
              labelText: 'Street 1',
            ),
            SizedBox(
              height: 38.0,
            ),
            Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextFormField(
                    labelText: 'Street 1',
                  ),
                  CustomTextFormField(
                    labelText: 'Street 1',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 160.0,
                  child: CustomButton(
                    onPressed: () {},
                    text: 'BACK',
                    color: Colors.transparent,
                    textColor: Colors.black,
                  ),
                ),
                Container(
                  width: 160.0,
                  child: CustomButton(
                    onPressed: () {},
                    text: 'NEXT',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
