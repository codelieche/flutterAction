// 用户登录页
// 我们会设置多个用户登录页
import 'package:flutter/material.dart';

// 引入示例1
import 'demo01.dart';
import 'demo02.dart';

class UserLoginIndexPage extends StatefulWidget {
  UserLoginIndexPage({Key key}) : super(key: key);

  @override
  _UserLoginIndexPageState createState() => _UserLoginIndexPageState();
}

class _UserLoginIndexPageState extends State<UserLoginIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("登录示例1"),
          subtitle: Text("username、password、button"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserLoginDemo01();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("登录示例2"),
          subtitle: Text("logo、username、password、button"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserLoginDemo02();
            }));
          },
        ),
      ],
    );
    return body;
  }
}
