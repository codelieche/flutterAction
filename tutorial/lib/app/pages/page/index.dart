
import 'package:flutter/material.dart';

class PageDemoIndexPage extends StatefulWidget {
  @override
  _PageDemoIndexPageState createState() => _PageDemoIndexPageState();
}

class _PageDemoIndexPageState extends State<PageDemoIndexPage> {

  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("页面示例", style: TextStyle(color: Colors.white),),
        elevation: 0.0,  // 阴影，默认是4.0
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pushNamed(context, "/page/404");
          },
          child: Text("演示404"),
        ),
      ),
    );

//    return Container(
//      child: scaffold,
//    );
      return scaffold;
  }
}
