import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/phone_controller.dart';
import 'package:otp_using_firebase/utils/app_colors.dart';
import 'package:otp_using_firebase/utils/phone_auth_const.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/action_button_widget.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/auth_header.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/phone_input_field.dart';
import 'package:otp_using_firebase/views/widgets/phone_auth_screen/term_text.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  final PhoneAuthController controller = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          PhoneAuthConstants.appBarTitle,
          style: TextStyle(
            color: AppColors.appBarText,
            fontWeight: PhoneAuthConstants.appBarFontWeight,
            fontSize: PhoneAuthConstants.appBarTitleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PhoneAuthConstants.horizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: PhoneAuthConstants.topSpacing),
                
                // Authentication header widget
                const AuthHeader(
                  icon: PhoneAuthConstants.headerIcon,
                  title: PhoneAuthConstants.headerTitle,
                  subtitle: PhoneAuthConstants.headerSubtitle,
                ),
                
                const SizedBox(height: PhoneAuthConstants.widgetSpacing),
                
                // Phone input field widget
                PhoneInputField(
                  onChanged: (phoneNumber) {
                    controller.completePhoneNumber.value = phoneNumber;
                  },
                ),
                
                const SizedBox(height: PhoneAuthConstants.buttonSpacing),
                
                // Action button widget
                Obx(() => ActionButton(
                  label: PhoneAuthConstants.actionButtonLabel,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.verifyPhoneNumber,
                )),
                
                const SizedBox(height: PhoneAuthConstants.termsSpacing),
                
                // Terms text widget
                const TermsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}