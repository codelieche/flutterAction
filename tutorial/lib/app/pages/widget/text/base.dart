// Text基本使用

import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class TextBaseDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.grey[200],
          child: ListTile(
            leading: Icon(
              Icons.text_fields,
              color: AppPrimaryColor,
            ),
            title: Text("基本使用", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Hello Flutter"),
            SizedBox(
              width: 20,
            ),
            Text(
              "设置颜色",
              style: TextStyle(color: Colors.pinkAccent),
            ),
            SizedBox(
              width: 20,
            ),
            Text("字体加粗", style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(
              width: 10,
            ),
            Text(
              "Hello Flutter",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("设置字体大小", style: TextStyle(fontSize: 16)),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 200,
              color: Colors.blue,
              padding: EdgeInsets.all(5),
              child: Text(
                "设置背景色和padding",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: SelectableText("SelectableText: 我是可以复制的Text, 双击即可复制"),
            ),
            Container(
                padding: EdgeInsets.all(5),
                color: Colors.lightBlue[100],
                width: 500,
                child: RichText(
                  text: TextSpan(
                      text: "RichText -> TextSpan:",
                      style: TextStyle(color: Colors.black87),
                      children: [
                        TextSpan(
                            text: "不同颜色",
                            style: TextStyle(
                                fontSize: 18, color: Colors.pinkAccent[100])),
                        TextSpan(
                            text: "不同Weight",
                            style: TextStyle(
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ]),
                ))
          ],
        ),
        // Divider(),
        // SizedBox(
        //   height: 20,
        // ),
      ],
    );
    return Container(
      child: body,
    );
  }
}
