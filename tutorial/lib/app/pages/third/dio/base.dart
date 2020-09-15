// Dio Base Demo
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tutorial/app/components/items/title.dart';

class DioBaseDemoPage extends StatefulWidget {
  DioBaseDemoPage({Key key}) : super(key: key);

  @override
  _DioBaseDemoPageState createState() => _DioBaseDemoPageState();
}

class _DioBaseDemoPageState extends State<DioBaseDemoPage>
    with SingleTickerProviderStateMixin {
  // dio实例
  Dio dio = Dio();
  var cookieJar;

  // Get的控制器
  TextEditingController _getInputController = TextEditingController(
      text: "http://192.168.6.1:9000/api/v1/account/login");
  TextEditingController _postInputController = TextEditingController(
      text: "http://192.168.6.1:9000/api/v1/account/login");
  TextEditingController _dataInputController = TextEditingController(
      text: '{"username": "admin", "password": "password"}');

  dioAddCookieManager() async {
//    Directory tempDir = await getTemporaryDirectory();
//    String tempPath = tempDir.path;
//    print("获取到的临时目录位置: $tempPath");

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    // print("appDocPath: $appDocPath");

    // 实例化CookieJar
    cookieJar = PersistCookieJar(dir: "$appDocPath/cookies");

    // dio.interceptors..add(LogInterceptor())..add(CookieManager(cookieJar));
    dio.interceptors..add(CookieManager(cookieJar));
  }

  @override
  void initState() {
    super.initState();
    // 添加cookie管理器
    dioAddCookieManager();
  }

  handlePostCommit() async {
    print("开始Post提交");

    // 获取数据
    String url = _postInputController.text;
    String data = _dataInputController.text;

    // 开始发起请求
    Response response;
    Options options = Options(headers: {"Content-Type": "application/json"});
    response = await dio.post(url, data: data, options: options);

    // 处理结果
    this.showResponseData(url, response);
  }

  showResponseData(String url, Response response) {
    if (response.statusMessage == "OK") {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(5),
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Get请求：$url"),
                    SimpleTitleWidget(title: "response.headers"),
                    Text(
                      response.headers.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(),
                    SimpleTitleWidget(title: "response.data"),
                    Text(
                      response.data.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    } else {
      print("发送Http请求出错");
    }
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "Get请求",
          description: "dio.get(url)",
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: _getInputController, // 控制器
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: "要访问的网址",
              border: OutlineInputBorder(),
              suffix: Container(
                width: 60,
                // height: 50,
                child: RaisedButton(
                  onPressed: () async {
                    // 得到url
                    String url = _getInputController.text;

                    // 异步的方式：
                    dio.get(url).then((Response response) {
                      // print(response);
                      // print("headers:${response.headers}");
                      print(
                          "$url: ${response.statusCode} ===> ${response.statusMessage}");
                    }).catchError((e) {
                      print("网络请求出现异常");
                    });

                    // 同步等待的方式
                    Response response = await dio.get(url);
                    this.showResponseData(url, response);
                  },
                  child: Text("提交"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                ),
              ),
            ),
            style: TextStyle(fontSize: 14),
          ),
        ),

        // Post请求
        SimpleTitleWidget(
          title: "Post请求",
          description: "dio.post(url, data: {})",
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _postInputController,
                  maxLines: 2,
                  style: TextStyle(fontSize: 13.0),
                  decoration: InputDecoration(
                    labelText: "网址",
                    hintText: "url",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: _dataInputController,
                  maxLines: 4,
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    labelText: "Data",
                    hintText: "请求数据",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                      onPressed: this.handlePostCommit,
                      child: Text("提交"),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}
