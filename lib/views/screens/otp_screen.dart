import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/otp_controller.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/app_bar_widget.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/otp_text_field.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/resend_otp.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/verify_otp_button.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationid;
  final OtpController controller = Get.put(OtpController());

  OtpScreen({super.key, required this.verificationid, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: otpAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Verify your number',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                  children: [
                    const TextSpan(text: 'Enter the code sent to '),
                    TextSpan(
                      text: phoneNumber,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              OtpTextField(controller: controller, verificationid: verificationid),
              const SizedBox(height: 20),
              OtpResendButton(),
              const SizedBox(height: 40),
              OtpVerifyButton(controller: controller, verificationid: verificationid),
            ],
          ),
        ),
      ),
    );
  }
}
