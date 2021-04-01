import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/core/services/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '', password = '', username = '';
  // Rx<User> _user = Rx<User>();

  final LocalStorageData _localStorageData = Get.find();

  // String get user => _user.value?.email;

  @override
  void onInit() {
    print('onInit Called');
    super.onInit();
    // _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  @override
  void onReady() {
    print('onReady Called');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose Called');
    super.onClose();
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword().then((user) async {
        saveUserData(user);
      });
      Get.offAll(() => ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Sign Up Failed\n Maybe the problem is with your Internet Connection',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword().then((value) async {
        saveUserData(value);
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(() => ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Login Failed',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.accessToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUserData(user);
      Get.offAll(() => ControlView());
    });
  }

  void facebookLoginMethod() async {
    final FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(['email']);
    final accessToken = facebookLoginResult.accessToken?.token;
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(facebookCredential).then((user) async {
        saveUserData(user);
        Get.offAll(() => ControlView());
      });
    }
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser()
        .getCurrentUser(uid)
        .then((value) => setUser(UserModel.fromJson(value.data())));
  }

  void saveUserData(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      username: username == null ? user.user.displayName : username,
      email: user.user.email,
      pic: '',
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await _localStorageData.setUser(userModel);
  }
}
