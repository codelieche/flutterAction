import 'package:flutter/material.dart';



class Page001 extends StatefulWidget {
  @override
  _Page001State createState() => _Page001State();
}

class _Page001State extends State<Page001> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 001"),
      ),
      body: Center(
        child: Text("page 001"),
      ),
    );
  }
}
