import 'package:flutter/material.dart';

import 'base.dart';

class ShowMenuDemoPage extends StatefulWidget {
  ShowMenuDemoPage({Key key}) : super(key: key);

  @override
  _ShowMenuDemoPageState createState() => _ShowMenuDemoPageState();
}

class _ShowMenuDemoPageState extends State<ShowMenuDemoPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ShowMenuBaseDemo(),
      ],
    );
  }
}
