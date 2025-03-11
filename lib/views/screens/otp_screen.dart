import 'package:flutter/material.dart';
import 'package:otp_using_firebase/controllers/opt_controller.dart';
import 'package:otp_using_firebase/views/widgets/otp_screens/otp_header.dart';
import 'package:otp_using_firebase/views/widgets/otp_screens/otp_input_field_widget.dart';
import 'package:otp_using_firebase/views/widgets/otp_screens/otp_resend.dart';
import 'package:otp_using_firebase/views/widgets/otp_screens/otp_verify_button.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final OtpController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OtpController(widget.verificationId);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Verification',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                // Header section
                OtpHeader(phoneNumber: widget.phoneNumber),
                
                const SizedBox(height: 40),
                
                // OTP input fields
                OtpInputField(
                  controller: _controller.otpController,
                  onCompleted: _controller.verifyOtp,
                ),
                
                const SizedBox(height: 20),
                
                // Resend code option
                ResendCodeRow(onResend: _controller.resendCode),
                
                const SizedBox(height: 40),
                
                // Verify button
                ValueListenableBuilder<bool>(
                  valueListenable: _controller.isLoadingNotifier,
                  builder: (context, isLoading, _) {
                    return VerifyButton(
                      isLoading: isLoading,
                      onPressed: _controller.verifyOtp,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}