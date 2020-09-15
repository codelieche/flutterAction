// 打开外部应用
// https://pub.flutter-io.cn/packages/url_launcher

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLancherIndexPage extends StatefulWidget {
  UrlLancherIndexPage({Key key}) : super(key: key);

  @override
  _UrlLancherIndexPageState createState() => _UrlLancherIndexPageState();
}

class _UrlLancherIndexPageState extends State<UrlLancherIndexPage> {
  // url输入框
  TextEditingController _urlInputController =
      TextEditingController(text: "https://www.codelieche.com");
  // 电话
  TextEditingController _photoInputController =
      TextEditingController(text: "sms:123456");
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // 访问网址
        Container(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _urlInputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () async {
                    var url = _urlInputController.text;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw "不能打开：$url";
                    }
                  },
                  child: Text("打开浏览器"),
                ),
              ),
            )
          ],
        ),

        // 打电话
        Container(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _photoInputController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              // prefixText: "tel:",
            ),
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  onPressed: () async {
                    var photo = _photoInputController.text;
                    if (await canLaunch(photo)) {
                      await launch(photo);
                    } else {
                      throw "不能打开：$photo";
                    }
                  },
                  child: Text("发送短信"),
                ),
              ),
            )
          ],
        ),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("打开外部应用"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}
