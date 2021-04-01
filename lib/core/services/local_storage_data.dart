import 'dart:convert';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get user async {
    try {
      UserModel userModel = await getUser();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
