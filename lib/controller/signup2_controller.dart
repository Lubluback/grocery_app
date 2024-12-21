
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:grocery_application/model/userdetails_model.dart';
// import 'package:grocery_application/services/signup1_services.dart';


// class Signup2Controller extends GetxController {
//   //  final FirebaseAuth _auth = FirebaseAuth.instance;
  
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController phonenumbercontroller = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   String? username(val) {
//     final bool name = RegExp('[a-zA-Z]').hasMatch(val!);
//     if (val.trim().isEmpty) {
//       return "required name";
//     } else if (!name) {
//       return 'invalid username';
//     }
//     return null;
//   }

//   String? phoneNumber(val) {
//     if (val!.trim().isEmpty) {
//       return "phone is required";
//     } else if (val.length != 10) {
//       return "not valid";
//     }
//     return null;
//   }

//   // Store user details in Firestore
//   // Future<void> storeUserDetails(String uid, UserModel user) async {
//   //   try {
//   //     await _firestoreService.storeUserDetails(uid, user);
//   //     Get.snackbar('Success', 'User details saved successfully!');
//   //   } catch (e) {
//   //     Get.snackbar('Error', e.toString());
//   //   }
//   // }

//   Future<bool> formvalidation() async {
    
//     if (formkey.currentState!.validate()) {
//       // final data =
//       //     await Signup1Services.signUp(null, null);
      
//       await Signup1Services.createUser(
        
//           UserModel(
//               username: usernameController.text,
//               phoneNumber: phonenumbercontroller.text,
//               email:null,
//               addressLine1: null,
//               city: null,
//               pincode: null,
//               state: null,
//               addressLine2: null,
//               uid: null));

//       return true;
//     }
//     return false;
//   }

//   // void createSignUp2() {}
// }
