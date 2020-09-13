// Demo Index Page
import 'package:flutter/material.dart';

class DemoIndexPage extends StatefulWidget {
  DemoIndexPage({Key key}) : super(key: key);

  @override
  _DemoIndexPageState createState() => _DemoIndexPageState();
}

class _DemoIndexPageState extends State<DemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Demo Index Page"),
      ),
    );
  }
}
