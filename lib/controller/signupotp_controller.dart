// lib/controllers/auth_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grocery_application/services/signu_otp.dart';


class OtpController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();

  // Reactive state variables
  var isOtpSent = false;
  var phoneNumber = '';
  var verificationId = '';

  // Send OTP
  Future<void> sendOtp(String phone) async {
    try {
      await _authService.sendOtp(
        phoneNumber: phone,
        onCodeSent: (String verificationId) {
          this.verificationId= verificationId;
          isOtpSent = true;
          Get.snackbar("Success", "OTP sent to $phone");
        },
        onVerificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error", e.message ?? "Verification failed.");
        },
        onVerificationCompleted: (credential) async {
          // Auto verification
          await _authService.verifyOtp(
            verificationId: verificationId,
            smsCode: credential.smsCode!,
          );
          Get.snackbar("Success", "Phone number verified automatically.");
        },
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Verify OTP
  Future<void> verifyOtp(String otp) async {
    try {
      final user = await _authService.verifyOtp(
        verificationId: verificationId,
        smsCode: otp,
      );
      if (user != null) {
        Get.snackbar("Success", "Phone number verified. Welcome, ${user.phoneNumber}!");
      }
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP. Please try again.");
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _authService.signOut();
    Get.snackbar("Success", "Signed out successfully.");
    isOtpSent = false;
    phoneNumber= '';
    verificationId = '';
  }
}