import 'package:flutter/material.dart';
import 'package:tutorial/app/components/forms/info.dart';
import 'package:tutorial/app/components/forms/input.dart';
import 'package:tutorial/app/components/items/title.dart';

class PageFormsInfoBaseDemoPage extends StatefulWidget {
  PageFormsInfoBaseDemoPage({Key key}) : super(key: key);

  @override
  _PageFormsInfoBaseDemoPageState createState() =>
      _PageFormsInfoBaseDemoPageState();
}

class _PageFormsInfoBaseDemoPageState extends State<PageFormsInfoBaseDemoPage> {
  Alignment valueAlignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "实现的样式",
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.white,
            child: Column(
              children: [
                // 第一行：创建者
                InfoDisplayStyle01(
                  title: "ID",
                  value: "123",
                  isFirst: true,
                  valueAlignment: valueAlignment,
                ),
                InfoDisplayStyle01(
                  title: "属性",
                  value: "属性值",
                  valueAlignment: valueAlignment,
                ),
                InfoDisplayStyle01(
                  title: "名字",
                  value: "codelieche",
                  valueAlignment: valueAlignment,
                ),
                InfoDisplayStyle01(
                  title: "网址",
                  value: "www.codelieche",
                  valueAlignment: valueAlignment,
                ),
                InfoDisplayStyle01(
                  title: "描述",
                  value: "编程列车的描述信息, 描述信息啦, codelieche,www.codelieche,描述信息。",
                  valueAlignment: valueAlignment,
                ),
                InfoDisplayStyle01(
                  backgroundColor: Colors.white,
                  textColor: Colors.black87,
                  title: "搜索Input",
                  valueAlignment: valueAlignment,
                  borderWidth: 0,
                  borderColor: Colors.white,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  titleAlignment: Alignment.centerLeft,
                  valueWidget: BaseInputWidget(
                    height: 30,
                    prefixIcon: Icon(Icons.search, size: 16),
                    hintText: "search",
                    initialValue: "keyword",
                    borderWidth: 0.5,
                    borderRadius: 5,
                    borderColor: Colors.grey[400],
                    backgroundColor: Colors.grey[50],
                    showClearButton: true,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // 控制按钮
          Container(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    onPressed: () {
                      setState(() {
                        valueAlignment = Alignment.topLeft;
                      });
                    },
                    child: Text("topLeft"),
                  ),
                ),
                Expanded(
                  child: OutlineButton(
                    onPressed: () {
                      setState(() {
                        valueAlignment = Alignment.center;
                      });
                    },
                    child: Text("center"),
                  ),
                ),
                Expanded(
                  child: OutlineButton(
                    onPressed: () {
                      setState(() {
                        valueAlignment = Alignment.topRight;
                      });
                    },
                    child: Text("topRight"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // 返回
    return SingleChildScrollView(
      child: body,
      physics: AlwaysScrollableScrollPhysics(),
    );
  }
}
