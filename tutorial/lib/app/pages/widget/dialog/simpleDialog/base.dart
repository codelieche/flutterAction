// SimpleDialog基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class SimpleDialogBaseDemo extends StatefulWidget {
  SimpleDialogBaseDemo({Key key}) : super(key: key);

  @override
  _SimpleDialogBaseDemoState createState() => _SimpleDialogBaseDemoState();
}

class _SimpleDialogBaseDemoState extends State<SimpleDialogBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "基本使用", description: "showDialog"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  // 显示对话框
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("警告！"),
                        children: [
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_right),
                                title: Text("第一条消息"),
                              ),
                              ListTile(
                                leading: Icon(Icons.arrow_right),
                                title: Text("第二条消息"),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("基本使用"),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () async {
                  // 显示对话框
                  var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text(
                          "警告！",
                          style: TextStyle(color: Colors.orange),
                        ),
                        children: [
                          Column(
                            children: [
                              Divider(),
                              ListTile(
                                leading: Icon(Icons.arrow_right),
                                title: Text("第一条消息"),
                              ),
                              ListTile(
                                leading: Icon(Icons.arrow_right),
                                title: Text("第二条消息"),
                              ),
                              ButtonBar(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop("close");
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.check),
                                    onPressed: () {
                                      Navigator.of(context).pop("ok");
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  );
                  // 得到结果
                  print(result);
                },
                child: Text("示例二"),
              ),
            ),
          ],
        ),
      ],
    );
    // 返回
    return body;
  }
}
