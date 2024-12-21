import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_application/model/userdetails_model.dart';

class Signup1Services {
  static Future<UserCredential?> signUp(String? email, String? password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      print("User signed up: ${userCredential.user?.email}");
      print("User signed up: ${userCredential.user?.uid}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("The password is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print("The account already exists for that email.");
      }
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<void> createUser(String uid, UserModel user) async {
    if (uid.isEmpty) {
      throw Exception(
          "Error: User ID is null or empty. Cannot create document in Firebase.");
    }
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(uid).set(user.toJson());
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  // Store user details in Firestore
  static Future<void> updateUser(String uid, UserModel data) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(data.uid).update(data.toJson());
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }

  static Future<UserModel?> getUserDetails(String uid) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch user details: $e");
    }
  }
}
