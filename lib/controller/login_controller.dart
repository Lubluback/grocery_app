import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_application/services/login_services.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';
import 'package:grocery_application/services/signup1_services.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = false;

  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  String? email(val) {
    final bool name = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required email";
    } else if (!name) {
      return 'invalid email Id';
    }
    return null;
  }

  String? passwordValidation(val) {
    final bool name =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required password";
    } else if (!name) {
      return 'invalid password';
    } else {}

    return null;
  }

  Future<bool> login() async {
    if (formkey.currentState!.validate()) {
      // String email = emailController.text;
      // String password = passwordcontroller.text;
      final data = await Loginservices.logIn(
          emailController.text, passwordcontroller.text);
      print(emailController.text);
      print(passwordcontroller.text);
      if (data != null) {
        final result = await Signup1Services.getUserDetails(data.user!.uid);
        if (result != null) {
          Sharedpreference.saveUser(result);
        }
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
