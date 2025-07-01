// lib/views/screens/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/otp_controller.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/app_bar_widget.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/header.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/otp_text_field.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/resend_otp.dart';
import 'package:otp_using_firebase/views/widgets/otp_screen/verify_otp_button.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationid;
  final OtpController controller = Get.put(OtpController());

  OtpScreen({
    super.key,
    required this.verificationid,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const OtpAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              OtpHeader(phoneNumber: phoneNumber),
              const SizedBox(height: 40),
              OtpTextField(
                controller: controller,
                verificationid: verificationid,
              ),
              const SizedBox(height: 20),
              const OtpResendButton(),
              const SizedBox(height: 40),
              OtpVerifyButton(
                controller: controller,
                verificationid: verificationid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}