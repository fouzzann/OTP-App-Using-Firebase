import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/views/screens/otp_screen.dart';

class PhoneAuthController {
  final TextEditingController phoneController = TextEditingController();
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);
  String completePhoneNumber = '';

  void dispose() {
    phoneController.dispose();
    isLoadingNotifier.dispose();
  }

  void updatePhoneNumber(String phoneNumber) {
    completePhoneNumber = phoneNumber;
  }

  Future<void> verifyPhoneNumber() async {
    isLoadingNotifier.value = true;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-verification completed (Android only)
          isLoadingNotifier.value = false;
        },
        verificationFailed: (FirebaseAuthException ex) {
          isLoadingNotifier.value = false;

          // Show error message
          Get.snackbar(
            'Error',
            ex.message ?? 'Something went wrong',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          isLoadingNotifier.value = false;

          // Navigate to OTP screen
          Get.to(
            () => OtpScreen(
              verificationId: verificationId,
              phoneNumber: completePhoneNumber,
            ),
            transition: Transition.rightToLeft,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: completePhoneNumber,
      );
    } catch (e) {
      isLoadingNotifier.value = false;

      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}