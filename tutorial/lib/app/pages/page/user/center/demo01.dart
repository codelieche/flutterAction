import 'package:flutter/material.dart';

class UserCenterDemo01 extends StatefulWidget {
  UserCenterDemo01({Key key}) : super(key: key);

  @override
  _UserCenterDemo01State createState() => _UserCenterDemo01State();
}

class _UserCenterDemo01State extends State<UserCenterDemo01> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        Text("username"),
        Text("password"),
        Text("登录"),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: body,
    );

    // 返回
    return scaffold;
  }
}
