import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerX extends GetxController {
  late final WebViewController controller;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading.value = true;
          },
          onPageFinished: (String url) {
            isLoading.value = false;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev/showcase'));
  }

  void reloadPage() {
    controller.reload();
  }
}
