import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/controllers/phone_controller.dart';
import 'package:otp_using_firebase/controllers/web_view_controller.dart';
import 'package:otp_using_firebase/views/screens/phone_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final WebViewControllerX controllerX = Get.put(WebViewControllerX());

  WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Web Browser",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Show confirmation dialog before logout
              Get.defaultDialog(
                title: "Logout",
                middleText: "Are you sure you want to logout?",
                textConfirm: "Yes",
                textCancel: "No",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back(); // Close dialog

                  // Delete the PhoneAuthController to reset state
                  if (Get.isRegistered<PhoneAuthController>()) {
                    Get.delete<PhoneAuthController>();
                  }

                  // Navigate to PhoneAuthPage
                  Get.offAll(() => PhoneAuthPage());
                },
              );
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: controllerX.reloadPage,
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controllerX.controller),
          Obx(() => controllerX.isLoading.value
              ? const Center(child: CircularProgressIndicator(color: Colors.blue))
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
