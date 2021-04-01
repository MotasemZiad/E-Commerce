import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  DetailsScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    right: kPaddingContent,
                    left: kPaddingContent,
                    bottom: kPaddingContent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: kBorderColor,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Size'),
                                CustomText(
                                  text: model.size,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: kBorderColor,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Colour'),
                                Container(
                                  width: 20.0,
                                  height: 20.0,
                                  padding: EdgeInsets.all(kPaddingContent),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text: 'Details',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomText(
                        text: model.description,
                        fontSize: 14.0,
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: '\$${model.price}',
                        color: kPrimaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => Container(
                      width: 200.0,
                      child: CustomButton(
                        onPressed: () {
                          controller.addProduct(
                            CartProductModel(
                              productId: model.productId,
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                            ),
                          );
                          Get.snackbar(
                            'Success',
                            'Item added successfully',
                            colorText: Colors.white,
                            backgroundColor: Colors.green[400],
                            animationDuration: Duration(milliseconds: 800),
                            duration: Duration(milliseconds: 1500),
                          );
                        },
                        text: 'ADD TO CART',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
