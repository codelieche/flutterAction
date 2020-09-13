// dio index page
import 'package:flutter/material.dart';

class DioDemoIndexPage extends StatefulWidget {
  DioDemoIndexPage({Key key}) : super(key: key);

  @override
  _DioDemoIndexPageState createState() => _DioDemoIndexPageState();
}

class _DioDemoIndexPageState extends State<DioDemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("dio"),
      ),
    );

    // 返回
    return scaffold;
  }
}
