import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:tutorial/app/utils/fetchApi/base.dart';
import 'package:tutorial/app/utils/screen/adapter.dart';
import 'package:tutorial/app/utils/storage/shareData.dart';
import 'package:tutorial/app/variables.dart';

class UserLoginDemo02 extends StatefulWidget {
  UserLoginDemo02({Key key}) : super(key: key);

  @override
  _UserLoginDemo02State createState() => _UserLoginDemo02State();
}

class _UserLoginDemo02State extends State<UserLoginDemo02> {
  String username; // 用户名
  String password; // 用户密码
  bool savePassword = true; // 是否保存密码, 默认保存
  bool isRequesting = false; // 是否正在发起请求

  // focus: 设置focus和取消focus需要用到
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  // TextInput的控制器，提交登录的时候，通过控制器获取输入的值
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getUsernamePassword();
  }

  getUsernamePassword() async {
    username = await getSharedPreferencesString("username");
    password = await getSharedPreferencesString("password");
    print("获取用户名和密码：$username ---> $password");
    _usernameController.text = username;
    _passwordController.text = password;
    setState(() {
      username = username;
      password = password;
    });
  }

  // 处理登录请求函数
  handleLoginSubmmit() async {
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
      // 判断是否记住账号密码
      if (savePassword) {
        print("需要保存账号和密码");
        setSharePreferencesString("username", username);
        setSharePreferencesString("password", password);
      }

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
                      height: ScreenAdapter.setHeight(100),
                      // height: 100,
                    ),

                    // Logo
                    Container(
                      // height: ScreenAdapter.setHeight(80),
                      height: 80,
                      padding: EdgeInsets.only(bottom: 15),
                      child: Image.asset("assets/images/codelieche-blue.png"),
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
                        ),
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
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: Checkbox(
                                    value: this.savePassword == true,
                                    onChanged: (checked) {
                                      print(
                                          "checked: $checked, savePassword:$savePassword");
                                      if (savePassword) {
                                        // 再次点击就是不保存了，清空用户名信息
                                        setSharePreferencesString(
                                            "username", "");
                                        setSharePreferencesString(
                                            "password", "");
                                      }
                                      setState(() {
                                        savePassword = checked;
                                      });
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (savePassword) {
                                      // 再次点击就是不保存了，清空用户名信息
                                      setSharePreferencesString("username", "");
                                      setSharePreferencesString("password", "");
                                    }
                                    setState(() {
                                      savePassword = !savePassword;
                                    });
                                  },
                                  child: Text(
                                    "保存密码?",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: FlatButton(
                          //     onPressed: null,
                          //     child: Text("忘记密码"),
                          //   ),
                          // ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: null,
                              child: Text(
                                "注册",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
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
                            // color: Colors.lightBlue,
                            onPressed: this.handleLoginSubmmit,
                            child: Text("登录"),
                          ),
                        ))
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
