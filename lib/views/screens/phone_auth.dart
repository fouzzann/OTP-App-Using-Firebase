import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/phone_controller.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/action_button_widget.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/auth_header.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/phone_input_field.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/term_text.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  final PhoneAuthController controller = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Phone Verification',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                
                // Authentication header widget
                const AuthHeader(
                  icon: Icons.phone_android,
                  title: 'Verify Your Phone Number',
                  subtitle: 'We\'ll send you a one-time verification code to confirm your identity',
                ),
                
                const SizedBox(height: 40),
                
                // Phone input field widget
                PhoneInputField(
                  onChanged: (phoneNumber) {
                    controller.completePhoneNumber.value = phoneNumber;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Action button widget
                Obx(() => ActionButton(
                  label: 'Send Verification Code',
                  isLoading: controller.isLoading.value,
                  onPressed: controller.verifyPhoneNumber,
                )),
                
                const SizedBox(height: 20),
                
                // Terms text widget
                const TermsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}