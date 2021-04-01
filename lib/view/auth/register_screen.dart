import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      text: 'Sign Up',
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    CustomTextFormField(
                      labelText: 'Username',
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        controller.username = value;
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
                      height: 30,
                    ),
                    CustomButton(
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          controller.createUserWithEmailAndPassword();
                        }
                      },
                      text: 'SIGN UP',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
