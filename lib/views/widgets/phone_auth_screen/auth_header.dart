import 'package:flutter/material.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/phone_auth_const.dart';

class AuthHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(PhoneAuthConstants.mediumSpacing),
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: PhoneAuthConstants.headerIconSize,
            color: AppColors.headerIconColor,
          ),
        ),
        const SizedBox(height: PhoneAuthConstants.largeSpacing),
        Text(
          title,
          style: const TextStyle(
            fontSize: PhoneAuthConstants.headerTitleSize,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: PhoneAuthConstants.smallSpacing),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: PhoneAuthConstants.headerSubtitleSize,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}