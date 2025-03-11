import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/otp_controller.dart';

class OtpVerifyButton extends StatelessWidget {
  final OtpController controller;
  final String verificationid;

  const OtpVerifyButton({super.key, required this.controller, required this.verificationid});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Obx(
        () => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          onPressed: controller.isLoading.value ? null : () => controller.verifyOtp(verificationid),
          child: controller.isLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Verify',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
