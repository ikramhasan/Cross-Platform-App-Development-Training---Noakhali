import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsitePage extends StatelessWidget {
  WebsitePage({Key? key}) : super(key: key);

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: WebView(
        initialUrl: 'https://redhalozen.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
