// Wrap综合使用示例
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
import 'package:tutorial/app/components/items/title.dart';

class WrapComplexDemoPage extends StatefulWidget {
  WrapComplexDemoPage({Key key}) : super(key: key);

  @override
  _WrapComplexDemoPageState createState() => _WrapComplexDemoPageState();
}

class _WrapComplexDemoPageState extends State<WrapComplexDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("base Demo Page"),
    );
  }
}
