import 'package:flutter/material.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/phone_auth_const.dart';
class ActionButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.label,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: PhoneAuthConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          disabledBackgroundColor: AppColors.buttonDisabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PhoneAuthConstants.buttonBorderRadius),
          ),
          padding: PhoneAuthConstants.buttonPadding,
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.background),
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: PhoneAuthConstants.buttonTextSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.background,
                ),
              ),
      ),
    );
  }
}