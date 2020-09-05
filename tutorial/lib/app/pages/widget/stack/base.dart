// Stack基本使用示例
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
import 'package:tutorial/app/components/items/title.dart';

class StackBaseDemoPage extends StatefulWidget {
  StackBaseDemoPage({Key key}) : super(key: key);

  @override
  _StackBaseDemoPageState createState() => _StackBaseDemoPageState();
}

class _StackBaseDemoPageState extends State<StackBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("base Demo Page"),
    );
  }
}
