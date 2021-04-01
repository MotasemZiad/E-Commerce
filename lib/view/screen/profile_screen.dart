import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widget/custom_list_tile.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
              ),
            )
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(
                  top: 64.0,
                  right: 16.0,
                  left: 16.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 60.0,
                              child: Image.asset(
                                'assets/images/image_profile.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: (controller.userModel.username == null ||
                                        controller.userModel.username == '')
                                    ? 'David Spade'
                                    : controller.userModel.username,
                                fontSize: 26.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomText(
                                  text: (controller.userModel.email == null ||
                                          controller.userModel.email == '')
                                      ? 'iamdavid@gmail.com'
                                      : controller.userModel.email),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 120.0,
                      ),
                      CustomListTile(
                        imageAsset: 'assets/images/icon_edit_profile.jpg',
                        title: 'Edit Profile',
                        iconData: Icons.keyboard_arrow_right,
                      ),
                      SizedBox(
                        height: kListTilePadding,
                      ),
                      CustomListTile(
                        imageAsset: 'assets/images/icon_location.jpg',
                        title: 'Shipping Address',
                        iconData: Icons.keyboard_arrow_right,
                      ),
                      SizedBox(
                        height: kListTilePadding,
                      ),
                      CustomListTile(
                        imageAsset: 'assets/images/icon_history.jpg',
                        title: 'Order History',
                        iconData: Icons.keyboard_arrow_right,
                      ),
                      SizedBox(
                        height: kListTilePadding,
                      ),
                      CustomListTile(
                        imageAsset: 'assets/images/icon_payment.jpg',
                        title: 'Cards',
                        iconData: Icons.keyboard_arrow_right,
                      ),
                      SizedBox(
                        height: kListTilePadding,
                      ),
                      CustomListTile(
                        imageAsset: 'assets/images/icon_alert.jpg',
                        title: 'Notifications',
                        iconData: Icons.keyboard_arrow_right,
                      ),
                      SizedBox(
                        height: kListTilePadding,
                      ),
                      GetBuilder<ProfileViewModel>(
                        init: Get.find(),
                        builder: (controller) => CustomListTile(
                          imageAsset: 'assets/images/icon_logout.jpg',
                          title: 'Log Out',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                elevation: 2.0,
                                titleTextStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                title: Text('Log Out'),
                                content:
                                    Text('Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        controller.signOut();
                                        Get.offAll(() => LoginScreen());
                                      },
                                      child: CustomText(
                                        text: 'Yes',
                                        color: Colors.red,
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: CustomText(
                                      text: 'No',
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

/// When we want to get the user picture from Firebase
// CircleAvatar(
//                         radius: 60.0,
//                         child: controller.userModel == null
//                             ? Image.asset(
//                                 'assets/images/image_profile.png',
//                                 fit: BoxFit.fill,
//                               )
//                             : (controller.userModel.pic == 'default'
//                                 ? Image.asset(
//                                     'assets/images/image_profile.png',
//                                     fit: BoxFit.fill,
//                                   )
//                                 : Image.network(
//                                     controller.userModel.pic,
//                                     fit: BoxFit.fill,
//                                   )),
//                       ),
