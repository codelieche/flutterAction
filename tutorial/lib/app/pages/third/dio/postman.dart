// 简单的Postman功能
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:tutorial/app/components/items/title.dart';

import 'package:tutorial/app/utils/fetchApi/base.dart';

class DioPostmanDemoPage extends StatefulWidget {
  DioPostmanDemoPage({Key key}) : super(key: key);

  @override
  _DioPostmanDemoPageState createState() => _DioPostmanDemoPageState();
}

class _DioPostmanDemoPageState extends State<DioPostmanDemoPage> {
  String method = "GET";
  String contentType = "application/json";

  // 三个控制器
  TextEditingController _urlInputController = TextEditingController(
    text: "/api/v1/account/login",
  );
  TextEditingController _dataInputController = TextEditingController();

  handleSubmitRequest() async {
    // 请求url
    String url = _urlInputController.text.trim();
    String data = _dataInputController.text.trim();
    // 发起请求
    Response response;
    // GET
    if (method == "GET") {
      response = await fetchApi.get(url);
    }

    if (method == "DELETE") {
      response = await fetchApi.delete(url);
    }

    // Post
    if (method == "POST") {
      Options options = Options(contentType: contentType);
      if (data != "") {
        response = await fetchApi.post(url, data: data, options: options);
      } else {
        response = await fetchApi.post(url);
      }
    }

    // PUT
    if (method == "PUT") {
      Options options = Options(contentType: contentType);
      if (data != "") {
        response = await fetchApi.put(url, data: data, options: options);
      } else {
        response = await fetchApi.put(url);
      }
    }

    // 处理Response
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
    // 下拉按钮
    List<DropdownMenuItem> methodItems = [
      DropdownMenuItem(child: Text("GET"), value: "GET"),
      DropdownMenuItem(child: Text("POST"), value: "POST"),
      DropdownMenuItem(child: Text("PUT"), value: "PUT"),
      DropdownMenuItem(child: Text("DELETE"), value: "DELETE"),
    ];

    // 请求内容选项
    List<DropdownMenuItem> contentTypeItems = [
      DropdownMenuItem(
        child: Text(
          "application/json",
          style: TextStyle(fontSize: 13),
        ),
        value: "application/json",
      ),
      DropdownMenuItem(
        child: Text(
          "application/x-www-form-urlencoded",
          style: TextStyle(fontSize: 13),
          overflow: TextOverflow.ellipsis,
        ),
        value: "application/x-www-form-urlencoded",
      ),
    ];

    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "Postman",
        ),
        // 请求方法
        Row(
          children: [
            Container(
              width: 80,
              height: 50,
              padding: EdgeInsets.only(left: 10, top: 15),
              margin: EdgeInsets.only(right: 5),
              color: Colors.blue[100],
              child: Text(
                "Method",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 100,
              // padding: EdgeInsets.all(2),
              child: DropdownButton(
                value: this.method, // 选中的值
                items: [...methodItems],
                onChanged: (value) {
                  if (value == "POST" && _dataInputController.text == "") {
                    _dataInputController.text =
                        '{"username": "admin", "password": "passworrd"}';
                  }
                  setState(() {
                    method = value;
                  });
                },
                iconSize: 18,
                underline: Text(""),
                // isExpanded: true,
                // elevation: 1,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 1),
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        // URL
        Row(
          children: [
            Container(
              width: 80,
              height: 50,
              padding: EdgeInsets.only(left: 10, top: 15),
              margin: EdgeInsets.only(right: 5),
              color: Colors.blue[100],
              child: Text(
                "Url",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 3, right: 5),
                child: TextField(
                  controller: _urlInputController,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(2),
                    hintText: "url",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            )
          ],
        ),

        SizedBox(height: 10),

        // 请求头信息
        Row(
          children: [
            Container(
              width: 80,
              height: 40,
              padding: EdgeInsets.only(left: 10, top: 10),
              margin: EdgeInsets.only(right: 5),
              color: Colors.blue[100],
              child: Text(
                "Data类型",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                width: 100,
                // padding: EdgeInsets.all(2),
                child: DropdownButton(
                  value: this.contentType, // 选中的值
                  items: contentTypeItems,
                  onChanged: (value) {
                    setState(() {
                      contentType = value;
                    });
                  },
                  iconSize: 18,
                  underline: Text(""),
                  // elevation: 1,
                ),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey[400], width: 1),
                // ),
              ),
            ),
          ],
        ),

        // 发送的数据
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _dataInputController,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "data",
                    labelText: "Data",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            )
          ],
        ),

        // 按钮
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: OutlineButton(
                  // color: Colors.pinkAccent,
                  splashColor: Colors.pinkAccent,
                  onPressed: () {},
                  child: Text("重置"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  splashColor: Colors.pinkAccent,
                  onPressed: this.handleSubmitRequest, // 发起请求
                  child: Text("提交"),
                ),
              ),
            )
          ],
        )
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}
