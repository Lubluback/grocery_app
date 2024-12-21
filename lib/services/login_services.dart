import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Loginservices {
  static Future<UserCredential?> logIn(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      UserCredential userdata = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      log(userdata.toString());
      return userdata;
      // print("User logged in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.toString());
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided.");
      }
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
