// 使用WebView
import 'package:flutter/material.dart';

// 引入示例
import 'webViewFlutter.dart';

class WebViewIndexPage extends StatefulWidget {
  WebViewIndexPage({Key key}) : super(key: key);

  @override
  _WebViewIndexPageState createState() => _WebViewIndexPageState();
}

class _WebViewIndexPageState extends State<WebViewIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("webView"),
      ),
      body: WebViewFlutterDemoPage(),
    );

    // 返回
    return scaffold;
  }
}
