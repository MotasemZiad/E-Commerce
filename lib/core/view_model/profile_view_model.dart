import 'package:e_commerce/core/services/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  UserModel _userModel;
  UserModel get userModel => _userModel;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.user.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }
}
