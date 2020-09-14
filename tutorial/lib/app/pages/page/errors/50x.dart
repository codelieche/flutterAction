// 50X错误页
import 'package:flutter/material.dart';

class ErrorPage50x extends StatefulWidget {
  ErrorPage50x({Key key}) : super(key: key);

  @override
  _ErrorPage50xState createState() => _ErrorPage50xState();
}

class _ErrorPage50xState extends State<ErrorPage50x> {
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("50x"),
      ),
      body: Container(
        child: Center(
          child: Text("50x页"),
        ),
      ),
    );

    // 返回
    return scaffold;
  }
}
