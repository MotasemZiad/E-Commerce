import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/screen/details_screen.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ))
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 70.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _searchFormField(),
                        SizedBox(height: 20.0),
                        CustomText(
                          text: 'Categories',
                          color: Colors.black,
                          alignment: Alignment.topRight,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 20.0),
                        _listViewCategories(),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Best Selling',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'See All',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _listViewProducts(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchFormField() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kLightGreyColor,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          cursorColor: kPrimaryColor,
          cursorHeight: kCursorHeight,
        ),
      );

  Widget _listViewCategories() => GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
          height: 100.0,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 20.0,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey.shade100,
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.network(
                        controller.categoryModel[index].image,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(text: controller.categoryModel[index].name),
                ],
              );
            },
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      );

  Widget _listViewProducts() => GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
          height: 350.0,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 20.0,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(
                        model: controller.productModel[index],
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          children: [
                            Container(
                              height: 220.0,
                              child: Image.network(
                                controller.productModel[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                  text: controller.productModel[index].name,
                                  fontWeight: FontWeight.w500,
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                  text: controller
                                      .productModel[index].description,
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  maxLine: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                  text: controller.productModel[index].price !=
                                          null
                                      ? '\$${controller.productModel[index].price}'
                                      : '\$free',
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      );
}
