// 用户中心页
// 我们会设置多个用户登录页
import 'package:flutter/material.dart';

// 用户信息示例
import 'info01.dart';

// 用户中心示例：
import './demo02.dart';

class UserCenterIndexPage extends StatefulWidget {
  UserCenterIndexPage({Key key}) : super(key: key);

  @override
  _UserCenterIndexPageState createState() => _UserCenterIndexPageState();
}

class _UserCenterIndexPageState extends State<UserCenterIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("个人信息页01"),
          subtitle: Text("头像、昵称、邮箱、简介等信息"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserCenterInfoDemo01();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("用户中心示例2"),
          subtitle: Text("username、password、button"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserCenterDemo02();
            }));
          },
        ),
      ],
    );
    return body;
  }
}
