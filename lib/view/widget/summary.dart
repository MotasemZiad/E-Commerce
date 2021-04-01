import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
          init: CartViewModel(),
          builder: (controller) => Column(
                children: [
                  SizedBox(
                    height: 38.0,
                  ),
                  Container(
                    width: 350.0,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      itemCount: controller.cartProductModel.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 180,
                                child: Image.network(
                                  controller.cartProductModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: controller.cartProductModel[index].name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                              CustomText(
                                text:
                                    '\$${controller.cartProductModel[index].price}',
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
    );
  }
}
