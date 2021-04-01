import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/util/constants.dart';
import 'package:e_commerce/view/auth/register_screen.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_button_social.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                decoration: TextDecoration.underline,
                                fontSize: 18.0,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: 'Sign in to continue',
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        CustomTextFormField(
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print('Error: null value');
                            }
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        CustomTextFormField(
                          labelText: 'Password',
                          isSecured: true,
                          onSaved: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print('Error: null value');
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onPressed: () {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              controller.signInWithEmailAndPassword();
                            }
                          },
                          text: 'SIGN IN',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: '-OR-',
                fontSize: 20.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              CustomButtonSocial(
                text: 'Sign in with Facebook',
                imageAsset: 'assets/images/facebook.png',
                onPressed: () {
                  controller.facebookLoginMethod();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonSocial(
                text: 'Sign in with Google',
                imageAsset: 'assets/images/google.png',
                onPressed: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
