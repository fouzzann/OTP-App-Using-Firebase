import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';

class OtpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OtpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        'Verification',
        style: TextStyle(
          color: AppColors.appBarText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}