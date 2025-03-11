import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:otp_using_firebase/controllers/otp_controller.dart';

class OtpTextField extends StatelessWidget {
  final OtpController controller;
  final String verificationid;

  const OtpTextField({super.key, required this.controller, required this.verificationid});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 50,
        fieldWidth: 45,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.grey.shade50,
        selectedFillColor: Colors.white,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey.shade300,
        selectedColor: Colors.blue,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller.otpController,
      keyboardType: TextInputType.number,
      onCompleted: (v) => controller.verifyOtp(verificationid),
      onChanged: (value) {},
    );
  }
}
