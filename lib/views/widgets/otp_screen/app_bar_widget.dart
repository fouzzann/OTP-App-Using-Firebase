import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget otpAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
      onPressed: () => Get.back(),
    ),
    title: const Text(
      'Verification',
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
