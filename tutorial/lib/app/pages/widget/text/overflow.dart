import 'package:flutter/material.dart';

import 'package:tutorial/app/variables.dart';

class TextOverFlowDemo extends StatelessWidget {
  const TextOverFlowDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = "这是一段很长的文本内容，可能会多行显示，用于测试text的overflow";

    var body = Column(
      children: [
        Container(
          color: Colors.grey[200],
          child: ListTile(
              leading: Icon(
                Icons.text_fields,
                color: AppPrimaryColor,
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "overflow",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "(需要设置maxLines)",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontStyle: FontStyle.italic))
                  ],
                ),
              )),
        ),
        // Container(
        //   padding: EdgeInsets.all(5),
        //   margin: EdgeInsets.all(5), // 边距5
        //   color: Colors.lightBlue[100],
        //   child: Text(data),
        // ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(right: 5), // 右边边距5
              color: Colors.lightBlue[100],
              width: 150,

              child: Text(
                "ellipsis: $data",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.lightBlue[100],
              width: 150,
              // height: 100,
              child: Text(
                "clip:$data",
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.lightBlue[100],
                  margin: EdgeInsets.all(5),
                  width: 150,
                  // height: 100,
                  child: Text(
                    "fade效果:$data",
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.lightBlue[100],
                  margin: EdgeInsets.all(5),
                  width: 150,
                  // height: 100,
                  child: Text(
                    "visible:$data",
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ))
            ]),
      ],
    );

    return Container(child: body);
  }
}
