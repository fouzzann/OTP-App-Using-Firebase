import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_using_firebase/phone_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool isLoading = true;  // To show a loading indicator

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            setState(() {
              isLoading = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev/showcase'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Flutter Showcase",style: TextStyle(fontWeight: FontWeight.w500),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Get.to(()=>PhoneAuth()); 
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
