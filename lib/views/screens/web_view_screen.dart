import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:otp_using_firebase/views/screens/phone_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true; // Show loading indicator
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false; // Hide loading indicator
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev/showcase'));
  }

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
              Get.to(() => PhoneAuth());
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading) 
            const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
        ],
      ),
    );
  }
}
 