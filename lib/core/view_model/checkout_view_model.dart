import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _processIndex = 0;
  int get processIndex => _processIndex;

  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;

  void changeIndex(int i) {
    _processIndex = i;
    if (_processIndex == 1) {
      _pages = Pages.AddAddress;
    } else if (_processIndex == 2) {
      _pages = Pages.Summary;
    } else if (_processIndex == 3) {
      Get.to(() => ControlView());
    }
    update();
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return kProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return kTodoColor;
    }
  }
}
