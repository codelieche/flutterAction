import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/app/utils/fetchApi/base.dart';
import 'package:tutorial/app/utils/screen/adapter.dart';
import 'package:tutorial/app/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserLoginDemo01 extends StatefulWidget {
  UserLoginDemo01({Key key}) : super(key: key);

  @override
  _UserLoginDemo01State createState() => _UserLoginDemo01State();
}

class _UserLoginDemo01State extends State<UserLoginDemo01> {
  String username; // 用户名
  String password; // 用户密码
  bool isRequesting = false; // 是否正在发起请求

  // focus: 设置focus和取消focus需要用到
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  // TextInput的控制器，提交登录的时候，通过控制器获取输入的值
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // 处理登录请求函数
  handleLoginSubmmit() async {
    // 判断是否正在发起登录请求，防止重复提交
    if (isRequesting) {
      print("正在发起登录请求中....");
      return;
    } else {
      setState(() {
        isRequesting = true;
      });
    }

    // 用户名和密码
    username = _usernameController.text;
    password = _passwordController.text;

    print("username:$username");
    print("password:$password");

    // 登录的地址：示例登录的地址，根据自己情况修改这个地址
    String loginUrl = "/api/v1/account/login";
    // 取消密码输入框的焦点
    if (_usernameFocusNode.hasFocus) {
      _usernameFocusNode.unfocus();
    }
    _passwordFocusNode.unfocus();

    // Http请求返回结果
    Response response;
    // 发起请求是可能报错的，
    try {
      // 判断用户名和密码是否为空
      if (username == "" || password == "") {
        // 弹出toast
        Fluttertoast.showToast(
          msg: "请输入用户名和密码",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM, // 消息位置
        );
        return;
      }

      // 发起请求
      response = await fetchApi.post(
        loginUrl,
        data: {"username": username, "password": password},
      );

      // 对结果进行判断:
      print(response.data);
      // print(response.headers);
      print(response.headers["content-type"]);
      print(response.data["message"]);
      // 获取消息需要调整：json -> modal
      String message = response.data["message"];

      // 弹出toast
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0,
        gravity: ToastGravity.BOTTOM, // 消息位置
      );
    } catch (e) {
      print("发起登录请求，捕获到错误!");
    } finally {
      // 成功与否，都需要重新设置isRequesting为false
      setState(() {
        isRequesting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // 主体内容
    Widget body = Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenAdapter.setHeight(120),
                      // height: 100,
                    ),

                    // 用户名
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5),
                          hintText: "用户名",
                          // prefixIcon: Container(
                          //   padding: EdgeInsets.only(bottom: 25),
                          //   child: Icon(Icons.account_box),
                          // ),
                        ),
                        // onChanged: (value) {
                        //   setState(() {
                        //     username = value;
                        //   });
                        // },
                        onEditingComplete: () {
                          _passwordFocusNode.requestFocus();
                        },
                        keyboardType: TextInputType.text,
                        focusNode: _usernameFocusNode,
                      ),
                    ),

                    // 密码
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _passwordController,
                        style: TextStyle(fontSize: 14),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5),
                          hintText: "用户密码",
                        ),
                        // onChanged: (value) {
                        //   setState(() {
                        //     password = value;
                        //   });
                        // },
                        focusNode: _passwordFocusNode,
                        onEditingComplete: () {
                          // 如果username非空，就开始执行登录
                          this.handleLoginSubmmit();
                        },
                      ),
                    ),
                    // 忘记密码和、新用户注册
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              onPressed: null,
                              child: Text("忘记密码"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: null,
                              child: Text("注册"),
                            ),
                          )
                        ],
                      ),
                    ),
                    // 按钮
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: AppPrimaryColor,
                              onPressed: this.handleLoginSubmmit,
                              child: Text("登录"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          FlatButton(
              onPressed: null,
              child: Text(
                "帮助",
                style: TextStyle(color: Colors.grey),
              ))
        ],
        elevation: 0.0,
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}
