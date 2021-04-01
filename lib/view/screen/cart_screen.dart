import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/screen/checkout_screen.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => Scaffold(
              body: controller.cartProductModel.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/empty_cart.svg',
                          width: 200.0,
                          height: 200.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          'Empty Cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: kPrimaryColor.withAlpha(175),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: controller.loading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.only(
                                      right: 16.0,
                                      left: 16.0,
                                      top: 32.0,
                                      bottom: 12.0),
                                  child: ListView.separated(
                                    itemCount:
                                        controller.cartProductModel.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 12.0,
                                    ),
                                    itemBuilder: (context, index) => Container(
                                      height: 120.0,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 120.0,
                                            width: 120.0,
                                            child: Image.network(
                                              controller.cartProductModel[index]
                                                  .image,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 45.0,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: controller
                                                      .cartProductModel[index]
                                                      .name,
                                                ),
                                                SizedBox(
                                                  height: 4.0,
                                                ),
                                                CustomText(
                                                  text:
                                                      '\$${controller.cartProductModel[index].price}',
                                                  color: kPrimaryColor,
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Container(
                                                  width: 120.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            kButtonBorderRadius),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .increaseQuantity(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          FontAwesomeIcons.plus,
                                                          size: kIconSize,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      CustomText(
                                                        text: controller
                                                            .cartProductModel[
                                                                index]
                                                            .quantity
                                                            .toString(),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          size: kIconSize,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16.0,
                            left: 16.0,
                            bottom: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: 'TOTAL',
                                    fontSize: 14.0,
                                    textAlign: TextAlign.left,
                                    color: Colors.grey,
                                  ),
                                  GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => CustomText(
                                      text: '\$${controller.totalPrice}',
                                      color: kPrimaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 160.0,
                                child: CustomButton(
                                  onPressed: () {
                                    Get.to(() => CheckoutScreen());
                                  },
                                  text: 'CHECKOUT',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
