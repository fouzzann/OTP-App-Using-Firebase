import 'package:flutter/material.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';

class OtpHeader extends StatelessWidget {
  final String phoneNumber;

  const OtpHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your number',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.otpTitle,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: AppColors.otpSubtitle,
              fontSize: 16,
            ),
            children: [
              const TextSpan(text: 'Enter the code sent to '),
              TextSpan(
                text: phoneNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.otpTitle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}