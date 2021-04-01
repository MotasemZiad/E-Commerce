import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/util/binding.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
      ).copyWith(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ControlView(),
      ),
    );
  }
}
