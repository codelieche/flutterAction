// 错误页
import 'package:flutter/material.dart';

// 用户登录页
import '../user/login/demo02.dart';

// 引入错误页
import '403.dart';
import '404.dart';
import '50x.dart';

class ErrorsIndexPage extends StatefulWidget {
  ErrorsIndexPage({Key key}) : super(key: key);

  @override
  _ErrorsIndexPageState createState() => _ErrorsIndexPageState();
}

class _ErrorsIndexPageState extends State<ErrorsIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // 401错误页
        ListTile(
          leading: Icon(Icons.error_outline, color: Colors.purple),
          title: Text("401跳转登录页"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return UserLoginDemo02();
              },
            ));
          },
        ),
        Divider(),

        // 403错误页
        ListTile(
          leading: Icon(Icons.error_outline, color: Colors.orangeAccent),
          title: Text("403跳转登录页"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ErrorPage403();
              },
            ));
          },
        ),
        Divider(),

        // 404错误页
        ListTile(
          leading: Icon(Icons.error_outline, color: Colors.lightBlue),
          title: Text("404跳转登录页"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ErrorPage404();
              },
            ));
          },
        ),
        Divider(),

        // 50x错误页
        ListTile(
          leading: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          title: Text("50x跳转登录页"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ErrorPage50x();
              },
            ));
          },
        ),
        Divider(),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("错误页"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}
