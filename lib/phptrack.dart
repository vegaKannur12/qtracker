import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MyWidget extends StatefulWidget {
  String urlphp;
   MyWidget({super.key,required this.urlphp}) {
    // TODO: implement MyWidget
  }
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final WebViewController controller;
   void initState() {
    super.initState();

    // #docregion webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) 
            {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.urlphp));
    // #enddocregion webview_controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child:  WebViewWidget(controller: controller),
      )  
    );
  }
}