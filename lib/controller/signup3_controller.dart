// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grocery_application/model/userdetails_model.dart';
// import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';
// import 'package:grocery_application/services/signup1_services.dart';

// class Signup3Controller extends GetxController {
// //final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController addressline1 = TextEditingController();
//   TextEditingController addressline2 = TextEditingController();
//   TextEditingController city = TextEditingController();
//   TextEditingController state = TextEditingController();
//   TextEditingController pincode = TextEditingController();

//   final formkey = GlobalKey<FormState>();
//   String? addressLine1Validation(String val) {
//     if (val.isEmpty) {
//       return 'required address';
//     }
//     return null;
//   }

//   String? addressLine2Validation(String val) {
//     if (val.isEmpty) {
//       return 'required address';
//     }
//     return null;
//   }

//   String? cityValidation(String val) {
//     if (val.isEmpty) {
//       return 'required address';
//     }
//     return null;
//   }

//   String? stateValidation(String val) {
//     if (val.isEmpty) {
//       return 'required address';
//     }
//     return null;
//   }

//   String? pincodeValidation(String val) {
//     if (val.isEmpty) {
//       return 'required address';
//     }
//     return null;
//   }

//   Future<bool> formvalidation() async {
//     if (formkey.currentState!.validate()) {
//       final data = await Signup1Services.signUp(null, null);
//       final userdetails = UserModel(
//           username: null,
//           phoneNumber: null,
//           email: null,
//           addressLine1: addressline1.text,
//           city: city.text,
//           pincode: pincode.text,
//           state: state.text,
//           addressLine2: addressline2.text,
//           uid: null);

//       await Signup1Services.createUser( data,userdetails);
//       await Sharedpreference.saveUser(userdetails);

//       // Update local state
//       //  userdetails.value = userdetails;
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
