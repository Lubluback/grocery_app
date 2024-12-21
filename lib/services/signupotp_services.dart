import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupotpServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Variables for phone number, OTP, and verification ID
  String phoneNumber = '';
  String otp = '';
  String verificationId = '';
  bool isCodeSent = false;

  // Method to send OTP
  void sendOTP(context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatic verification (rarely occurs)
        await _auth.signInWithCredential(credential);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Phone number verified and user signed in!')),
        // );
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        //   Get.snackbar(
        //     SnackBar(content: Text('Verification failed: ${e.message}')),
        //   );
        // },
        Get.snackbar(
          'PhoneNumber Verification',
          'Verification failed: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      },
      codeSent: (String verId, int? resendToken) {
        isCodeSent = true;
        verificationId = verId;
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }

  // Method to verify OTP
  void verifyOTP(context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Phone number verified and user signed in!')),
      // );
      Get.snackbar(
        'PhoneNumber Verification',
        'Phone number verified and user signed in!',
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to verify OTP: $e')),
      // );
      Get.snackbar(
        'PhoneNumber Verification',
        'Failed to verify OTP: $e',
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }
}
