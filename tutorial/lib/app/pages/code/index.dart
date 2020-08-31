import 'package:flutter/material.dart';




class CodeIndexPage extends StatefulWidget {
  @override
  _CodeIndexPageState createState() => _CodeIndexPageState();
}

class _CodeIndexPageState extends State<CodeIndexPage> {

  Scaffold scaffold = Scaffold(
    appBar: AppBar(
      title: Text("组件示例"),
    ),
    body: ListView(
      children: [
        Column(
        children: [
          Container(
            height: 400,
            color: Colors.pinkAccent,
          ),
          Container(
            height: 400,
            color: Colors.lightBlue,
          ),
          Container(
            height: 400,
            color: Colors.yellow,
          )
        ],
      )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return scaffold;

  }
}
