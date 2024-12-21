import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_application/model/userdetails_model.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';
import 'package:grocery_application/services/signup1_services.dart';

class Signup1Controller extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController enteremail = TextEditingController();
  TextEditingController enterpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Rx isPasswordVisible = false.obs;
  UserModel? userModel;
  Signup1Controller() {
    userModel = UserModel(
        username: null,
        phoneNumber: null,
        email: null,
        addressLine1: null,
        city: null,
        pincode: null,
        state: null,
        addressLine2: null,
        uid: null);
  }

  String? emailvalidation(val) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val!);
    if (val.trim().isEmpty) {
      return "email is required";
    } else if (!emailValid) {
      return "not valid";
    }
    return null;
  }

  String? passwordValidation(val) {
    final bool name =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required name";
    } else if (!name) {
      return 'invalid password';
    }
    return null;
  }

  String? confirmpasswordValidation(val) {
    final bool name =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required password";
    } else if (!name) {
      return 'invalid password';
    } else if (enterpassword.text.trim() != confirmpassword.text.trim()) {
      return 'password not match';
    }
    return null;
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  // final formkey = GlobalKey<FormState>();
  String? username(val) {
    final bool name = RegExp('[a-zA-Z]').hasMatch(val!);
    if (val.trim().isEmpty) {
      return "required name";
    } else if (!name) {
      return 'invalid username';
    }
    return null;
  }

  String? phoneNumber(val) {
    if (val!.trim().isEmpty) {
      return "phone is required";
    } else if (val.length != 10) {
      return "not valid";
    }
    return null;
  }

  TextEditingController addressline1 = TextEditingController();
  TextEditingController addressline2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();

  // final formkey = GlobalKey<FormState>();
  String? addressLine1Validation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? addressLine2Validation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? cityValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? stateValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  String? pincodeValidation(String val) {
    if (val.isEmpty) {
      return 'required address';
    }
    return null;
  }

  Future<bool> formvalidation1() async {
    if (formkey.currentState!.validate()) {
      final data =
          await Signup1Services.signUp(enteremail.text, enterpassword.text);
      if (data != null) {
        userModel =
            userModel!.copyWith(email: enteremail.text, uid: data.user?.uid);
        // UserModel(
        //     username: null,
        //     phoneNumber: null,
        //     email: enteremail.text,
        //     addressLine1: null,
        //     city: null,
        //     pincode: null,
        //     state: null,
        //     addressLine2: null,
        //
        //    uid: data.user?.uid);
        return true;
      }
      // await Signup1Services.createUser(data,

      // UserModel(
      //     username: null,
      //     phoneNumber: null,
      //     email: enteremail.text,
      //     addressLine1: null,
      //     city: null,
      //     pincode: null,
      //     state: null,
      //     addressLine2: null,
      //     uid: null));
    }
    return false;
  }

  Future<bool> formvalidation2() async {
    if (formkey.currentState!.validate()) {
      // final data =
      //     await Signup1Services.signUp(null, null);

      // await Signup1Services.createUser(

      //     UserModel(
      //         username: usernameController.text,
      //         phoneNumber: phonenumbercontroller.text,
      //         email:null,
      //         addressLine1: null,
      //         city: null,
      //         pincode: null,
      //         state: null,
      //         addressLine2: null,
      //         uid: null));

      return true;
    }
    return false;
  }

  Future<bool> formvalidation3() async {
    if (formkey.currentState!.validate()) {
      userModel = userModel!.copyWith(
        username: usernameController.text,
        phoneNumber: phonenumbercontroller.text,
        addressLine1: addressline1.text,
        city: city.text,
        pincode: pincode.text,
        state: state.text,
        addressLine2: addressline2.text,
      );
      log(userModel.toString());

      await Signup1Services.createUser(userModel!.uid!, userModel!);

      // final userdetails = UserModel(
      // username: null,
      // phoneNumber: null,
      // email: null,
      // addressLine1: addressline1.text,
      // city: city.text,
      // pincode: pincode.text,
      // state: state.text,
      // addressLine2: addressline2.text,
      //     uid: null);

      //  await Signup1Services.createUser( data,userdetails);
      // await Sharedpreference.saveUser(userdetails);

      // Update local state
      //  userdetails.value = userdetails;
      userModel = await Signup1Services.getUserDetails(userModel!.uid!);
      if (userModel != null) {
        await Sharedpreference.saveUser(userModel!);
      } else {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }
}
