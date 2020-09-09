// Card的基本使用
import 'package:flutter/material.dart';

class CardBaseDemoPage extends StatefulWidget {
  CardBaseDemoPage({Key key}) : super(key: key);

  @override
  _CardBaseDemoPageState createState() => _CardBaseDemoPageState();
}

class _CardBaseDemoPageState extends State<CardBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 基本使用的主体内容
    Widget body = ListView(
      children: [
        // 第一个卡片
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "编程列车",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("www.codelieche.com"),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "邮箱：admin@codelieche.com",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),

        // 第2个卡片
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "codelieche",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("www.codelieche.com"),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "邮箱：admin@codelieche.com",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),

        // 第3个卡片：上面是图片，下面是文字描述
        Card(
          child: Column(
            children: [
              // 图片
              AspectRatio(
                aspectRatio: 16 / 4,
                // child: Image.asset(
                //   "asserts/images/codelieche-blue.png",
                //   // fit: BoxFit.cover,
                // ),
                child: Image.network(
                  "http://static.codelieche.com/docs/images/2020/07/01145131_22.png",
                  fit: BoxFit.cover,
                ),
              ),
              // 文字
              ListTile(
                leading: ClipOval(
                  child: Image.asset("asserts/images/codelieche-logo-blue.png"),
                ),
                title: Text(
                  "编程列车",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("www.codelieche.com"),
              )
            ],
          ),
        ),

        // 第4个卡片：上面是图片，下面是文字描述
        Card(
          child: Column(
            children: [
              // 图片
              AspectRatio(
                aspectRatio: 16 / 4,
                // child: Image.asset(
                //   "asserts/images/codelieche-blue.png",
                //   // fit: BoxFit.cover,
                // ),
                child: Image.network(
                  "http://static.codelieche.com/docs/images/2020/07/07160938_70.png",
                  fit: BoxFit.cover,
                ),
              ),
              // 文字
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset("asserts/images/codelieche-logo-blue.png"),
                ),
                title: Text(
                  "codelieche",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("www.codelieche.com"),
              )
            ],
          ),
        )
      ],
    );
    return body;
  }
}
