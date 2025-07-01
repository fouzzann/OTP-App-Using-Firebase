import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/phone_controller.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/action_button_widget.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/app_bar_widgets.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/auth_header.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/phone_input_field.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/term_text.dart';


class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({Key? key}) : super(key: key);

  final PhoneAuthController controller = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBarWidget(
        title: 'Phone Verification',
        automaticallyImplyLeading: false,
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
                const AuthHeaderWidget(
                  icon: Icons.phone_android,
                  title: 'Verify Your Phone Number',
                  subtitle: 'We\'ll send you a one-time verification code to confirm your identity',
                ),
                
                const SizedBox(height: 40),
                
                // Phone input field widget
                PhoneInputFieldWidget(
                  onChanged: (phoneNumber) {
                    controller.completePhoneNumber.value = phoneNumber;
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Action button widget
                Obx(() => ActionButtonWidget(
                  label: 'Send Verification Code',
                  isLoading: controller.isLoading.value,
                  onPressed: controller.verifyPhoneNumber,
                  icon: Icons.send,
                )),
                
                const SizedBox(height: 20),
                
                // Terms text widget
                TermsTextWidget(
                  onTermsPressed: () {
                    // Handle terms of service navigation
                    _showTermsDialog(context);
                  },
                  onPrivacyPressed: () {
                    // Handle privacy policy navigation
                    _showPrivacyDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Terms of Service'),
        content: const Text('Terms of Service content goes here...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: const Text('Privacy Policy content goes here...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}