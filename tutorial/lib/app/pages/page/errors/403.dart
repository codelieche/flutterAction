// 403错误页
import 'package:flutter/material.dart';

class ErrorPage403 extends StatefulWidget {
  ErrorPage403({Key key}) : super(key: key);

  @override
  _ErrorPage403State createState() => _ErrorPage403State();
}

class _ErrorPage403State extends State<ErrorPage403> {
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("403"),
      ),
      body: Container(
        child: Center(
          child: Text("403页"),
        ),
      ),
    );

    // 返回
    return scaffold;
  }
}
