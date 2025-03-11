import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/views/screens/web_view_screen.dart';

class OtpController {
  final TextEditingController otpController = TextEditingController();
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);
  final String verificationId;

  OtpController(this.verificationId);

  void dispose() {
    otpController.dispose();
    isLoadingNotifier.dispose();
  }

  void resendCode() {
    // Add resend code logic here
    Get.snackbar(
      'Info',
      'Code resent successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.blue,
    );
  }

  void verifyOtp() async {
    if (otpController.text.length != 6) {
      Get.snackbar(
        'Error',
        'Please enter a valid 6-digit code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    isLoadingNotifier.value = true;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.to(() => WebViewPage());
    } catch (ex) {
      log(ex.toString());
      Get.snackbar(
        'Error',
        'Invalid verification code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoadingNotifier.value = false;
    }
  }
}