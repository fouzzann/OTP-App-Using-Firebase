import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/app_text_style.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'By continuing, you agree to our Terms of Service and Privacy Policy',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        color: Colors.black45,
      ),
    );
  }
}


class TermsTextWidget extends StatelessWidget {
  final VoidCallback? onTermsPressed;
  final VoidCallback? onPrivacyPressed;
  final String? customText;

  const TermsTextWidget({
    Key? key,
    this.onTermsPressed,
    this.onPrivacyPressed,
    this.customText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.caption,
          children: [
            TextSpan(
              text: customText ?? 
                  'By continuing, you agree to our ',
            ),
            TextSpan(
              text: 'Terms of Service',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTermsPressed ?? _defaultTermsAction,
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onPrivacyPressed ?? _defaultPrivacyAction,
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  void _defaultTermsAction() {
    // Default action for terms - can be overridden
    debugPrint('Terms of Service clicked');
  }

  void _defaultPrivacyAction() {
    // Default action for privacy - can be overridden
    debugPrint('Privacy Policy clicked');
  }
}