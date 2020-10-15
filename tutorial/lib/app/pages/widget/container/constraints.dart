// 容器的限制
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ContainerConstraintsDemoPage extends StatefulWidget {
  ContainerConstraintsDemoPage({Key key}) : super(key: key);

  @override
  _ContainerConstraintsDemoPageState createState() =>
      _ContainerConstraintsDemoPageState();
}

class _ContainerConstraintsDemoPageState
    extends State<ContainerConstraintsDemoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // 十行数据
    ListView listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("第${index + 1}行"),
        );
      },
      itemCount: 10,
    );

    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "不设置限制",
          description: "包裹的container需要指定高度",
        ),
        Container(
          height: 200,
          color: Colors.white,
          child: listView,
        ),
        SimpleTitleWidget(
          title: "设置限制",
          description: "constraints: BoxConstraints()",
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: 200,
          ),
          color: Colors.grey[200],
          child: listView,
        ),
      ],
    );

    body = SingleChildScrollView(
      child: body,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Constraints"),
        elevation: 1.0,
      ),
      body: body,
    );
    return scaffold;
  }
}
