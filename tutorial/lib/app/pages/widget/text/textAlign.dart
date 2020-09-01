// Text基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class TextAlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = Column(
      children: [
        Container(
          color: Colors.grey[200],
          child: ListTile(
            leading: Icon(
              Icons.text_fields,
              color: AppPrimaryColor,
            ),
            title: Text("textAlign",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
            color: Colors.pinkAccent[100],
            width: double.infinity,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "left: 居左对其",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            )),
        Container(
            color: Colors.pinkAccent[100],
            width: double.infinity,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "center：居中对其",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
        Container(
            color: Colors.pinkAccent[100],
            width: double.infinity,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "right：居右对其",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
            )),
        // Divider(),
      ],
    );
    return Container(
      child: body,
    );
  }
}
