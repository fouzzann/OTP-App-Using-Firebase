// lib/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFBBDEFB);

  // Background Colors
  static const Color background = Colors.white;
  static const Color scaffoldBackground = Colors.white;
  static const Color cardBackground = Color(0xFFF8F9FA);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF2196F3);
  static const Color buttonSecondary = Color(0xFFE3F2FD);
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors
  static const Color borderPrimary = Color(0xFFE0E0E0);
  static const Color borderFocused = Color(0xFF2196F3);
  static const Color borderError = Color(0xFFF44336);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF616161);
  static const Color iconSecondary = Color(0xFF9E9E9E);
  static const Color iconAccent = Color(0xFF2196F3);

  // Additional Colors for Phone Auth
  static const Color appBarText = Color(0xFF212121); // Using existing textPrimary
  static const Color headerIconColor = Color(0xFF2196F3); // Using existing primary
  static const Color loadingIndicator = Color(0xFF2196F3); // Using existing primary
  static const Color termsLinkColor = Color(0xFF2196F3); // Using existing primary

  // OTP Screen Specific Colors
  static const Color otpTitle = Color(0xFF212121); // black87 equivalent
  static const Color otpSubtitle = Color(0xFF757575); // black54 equivalent
  static const Color otpFieldActive = Color(0xFF2196F3); // blue
  static const Color otpFieldInactive = Color(0xFFE0E0E0); // grey.shade300 equivalent
  static const Color otpFieldFill = Colors.white;
  static const Color otpFieldInactiveFill = Color(0xFFFAFAFA); // grey.shade50 equivalent
  static const Color otpResendText = Color(0xFF757575); // black54 equivalent
  static const Color otpResendLink = Color(0xFF2196F3); // blue
}