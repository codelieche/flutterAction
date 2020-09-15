// webview_flutter
// https://pub.flutter-io.cn/packages/webview_flutter
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutterDemoPage extends StatefulWidget {
  WebViewFlutterDemoPage({Key key}) : super(key: key);

  @override
  _WebViewFlutterDemoPageState createState() => _WebViewFlutterDemoPageState();
}

class _WebViewFlutterDemoPageState extends State<WebViewFlutterDemoPage> {
  String url = "http://www.codelieche.com";
  TextEditingController _urlInputController =
      TextEditingController(text: "http://www.codelieche.com");

  // webView控制器
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(fontSize: 13),
                  controller: _urlInputController,
                  decoration: InputDecoration(
                    prefix: Text("网址："),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // String newUrl = _urlInputController.text;
                        // print("newUrl:$newUrl");
                        setState(() {
                          url = _urlInputController.text;
                        });
                        // 跳转新的页面
                        _webViewController.loadUrl(_urlInputController.text);
                        // print(_webViewController.reload());
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    // print(value);
                    _webViewController.loadUrl(value);
                  },
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _webViewController = controller;
            },
            onPageStarted: (url) {
              print("onPageStarted: $url");
            },
            onPageFinished: (url) {
              print("onPageFinished:$url");
              _urlInputController.text = url;
            },
          ),
        )
      ],
    );
  }
}
