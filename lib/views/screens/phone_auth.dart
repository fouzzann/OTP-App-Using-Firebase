import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/phone_auth_controller.dart';
import 'package:otp_using_firebase/views/widgets/otp_screens/otp_verify_button.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen.dart/phone_auth_header.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen.dart/phone_input_fileld_widget.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen.dart/term_text_widget.dart';


class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final _formKey = GlobalKey<FormState>();
  late final PhoneAuthController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PhoneAuthController();
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
        title: const Text(
          'Phone Verification',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  
                  // Phone verification icon and header text
                  const PhoneAuthHeader(),
                  
                  const SizedBox(height: 40),
                  
                  // Phone number input field
                  PhoneInputField(
                    controller: _controller.phoneController,
                    onPhoneChanged: _controller.updatePhoneNumber,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Verify button
                  ValueListenableBuilder<bool>(
                    valueListenable: _controller.isLoadingNotifier,
                    builder: (context, isLoading, _) {
                      return VerifyButton(
                        isLoading: isLoading,
                        onPressed: () => _verifyPhoneNumber(_formKey),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Terms text
                  const TermsText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate() && 
        _controller.completePhoneNumber.isNotEmpty) {
      await _controller.verifyPhoneNumber();
    } else {
      Get.snackbar(
        'Invalid Phone Number',
        'Please enter a valid phone number',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}