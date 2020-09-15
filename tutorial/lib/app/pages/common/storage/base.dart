// 存储 基本使用
// https://pub.dev/packages/path_provider
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tutorial/app/components/items/title.dart';

class StorageBaseDemoPage extends StatefulWidget {
  StorageBaseDemoPage({Key key}) : super(key: key);

  @override
  _StorageBaseDemoPageState createState() => _StorageBaseDemoPageState();
}

class _StorageBaseDemoPageState extends State<StorageBaseDemoPage> {
  // 临时目录
  String tempDirPath;
  String appDocDirPath;

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // tmp
        SimpleTitleWidget(
          title: "获取临时目录",
          description:
              "Directory tempDir = await getTemporaryDirectory(); print(tempDir.path);",
        ),
        // 显示获取临时目录按钮，或者显示临时目录
        Row(
          children: [
            tempDirPath == null
                ? Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      onPressed: () async {
                        // 点击获取临时目录
                        Directory tempDir = await getTemporaryDirectory();
                        setState(() {
                          tempDirPath = tempDir.path;
                        });
                      },
                      child: Text("获取临时目录"),
                    ),
                  )
                : Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "临时目录路径为：",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          SelectableText(tempDirPath)
                        ],
                      ),
                    ),
                  )
          ],
        ),

        // app doc
        SimpleTitleWidget(
          title: "App文档目录",
          description:
              "Directory appDocDir = await getApplicationDocumentsDirectory(); print(appDocDir.path);",
        ),
        // 显示获取临时目录按钮，或者显示临时目录
        Row(
          children: [
            appDocDirPath == null
                ? Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      onPressed: () async {
                        // 点击获取App Documents目录
                        Directory appDocDir =
                            await getApplicationDocumentsDirectory();
                        setState(() {
                          appDocDirPath = appDocDir.path;
                        });
                      },
                      child: Text("获取App Documents目录"),
                    ),
                  )
                : Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "App Documents目录路径为：",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          SelectableText(appDocDirPath)
                        ],
                      ),
                    ),
                  )
          ],
        ),

        // 重置按钮
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    tempDirPath = null;
                    appDocDirPath = null;
                  });
                },
                child: Text("重置"),
              ),
            )
          ],
        )
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}
