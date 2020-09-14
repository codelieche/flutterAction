// 404错误页
import 'package:flutter/material.dart';

class ErrorPage404 extends StatefulWidget {
  ErrorPage404({Key key}) : super(key: key);

  @override
  _ErrorPage404State createState() => _ErrorPage404State();
}

class _ErrorPage404State extends State<ErrorPage404> {
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Container(
        child: Center(
          child: Text("404页"),
        ),
      ),
    );

    // 返回
    return scaffold;
  }
}
