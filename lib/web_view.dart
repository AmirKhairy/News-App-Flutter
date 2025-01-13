import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenn extends StatelessWidget {
  final String url;
  final String title;

  WebViewScreenn({super.key, required this.url,required this.title});

  @override
  Widget build(BuildContext context) {
    // Create a WebViewController inside the build method
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // You can add a loading indicator here
          },
          onPageStarted: (String url) {
            // Optionally handle when the page starts loading
          },
          onPageFinished: (String url) {
            // Optionally handle when the page finishes loading
          },
          onHttpError: (HttpResponseError error) {
            // Optionally handle HTTP errors
          },
          onWebResourceError: (WebResourceError error) {
            // Optionally handle web resource errors
          },
          onNavigationRequest: (NavigationRequest request) {
            
            return NavigationDecision.navigate; // Allow other navigation
          },
        ),
      )
      ..loadRequest(Uri.parse(url)); // Load the provided URL

    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: Theme.of(context).textTheme.bodyMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
