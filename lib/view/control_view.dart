import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green[500],
      statusBarBrightness: Brightness.dark,
    ));

    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() => GetBuilder<ControlViewModel>(
        init: Get.find(),
        builder: (controller) => BottomNavigationBar(
          elevation: 2.0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          items: [
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Column(
                  children: [
                    Text('Explore'),
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 4.0,
                    )
                  ],
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Image.asset(
                  'assets/images/explore.png',
                  fit: BoxFit.contain,
                  width: 20.0,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Column(
                  children: [
                    Text('Cart'),
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 4.0,
                    )
                  ],
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Image.asset(
                  'assets/images/cart.png',
                  fit: BoxFit.contain,
                  width: 20.0,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Column(
                  children: [
                    Text('Profile'),
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 4.0,
                    )
                  ],
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                  width: 20.0,
                ),
              ),
              label: '',
            ),
          ],
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
        ),
      );
}
