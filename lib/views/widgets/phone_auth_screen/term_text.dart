import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/phone_auth_const.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PhoneAuthConstants.mediumSpacing),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontSize: PhoneAuthConstants.termsTextSize,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
          children: [
            const TextSpan(text: 'By continuing, you agree to our '),
            TextSpan(
              text: PhoneAuthConstants.termsOfServiceText,
              style: const TextStyle(
                color: AppColors.termsLinkColor,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle Terms of Service tap
                  _handleTermsOfServiceTap();
                },
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: PhoneAuthConstants.privacyPolicyText,
              style: const TextStyle(
                color: AppColors.termsLinkColor,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle Privacy Policy tap
                  _handlePrivacyPolicyTap();
                },
            ),
          ],
        ),
      ),
    );
  }

  void _handleTermsOfServiceTap() {
    // Implement navigation to Terms of Service
    print('Terms of Service tapped');
  }

  void _handlePrivacyPolicyTap() {
    // Implement navigation to Privacy Policy
    print('Privacy Policy tapped');
  }
}