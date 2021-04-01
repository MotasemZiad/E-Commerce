import 'package:e_commerce/view/screen/cart_screen.dart';
import 'package:e_commerce/view/screen/home_screen.dart';
import 'package:e_commerce/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorIndex = 0;

  get navigatorIndex => _navigatorIndex;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          currentScreen = ProfileScreen();
          break;
        }
    }
    update();
  }
}
