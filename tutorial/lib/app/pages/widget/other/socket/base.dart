// Socket Base Demo
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:web_socket_channel/io.dart';

class SocketBaseDemoPage extends StatefulWidget {
  SocketBaseDemoPage({Key key}) : super(key: key);

  @override
  _SocketBaseDemoPageState createState() => _SocketBaseDemoPageState();
}

class _SocketBaseDemoPageState extends State<SocketBaseDemoPage> {
  WebSocket webSocket;
  IOWebSocketChannel channel;
  handleSocketConnect() async {
    // channel = await IOWebSocketChannel.connect(
    //   "wss://codelieche.com/ws/test/",
    //   headers: {
    //     'Connection': 'Upgrade',
    //     'Upgrade': 'websocket',
    //     'sec-websocket-version': '13',
    //     'Host': 'codelieche.com',
    //     'Origin': 'https://codelieche.com',
    //     // 'sec-websocket-key': key,
    //   },
    // );

    // channel.stream.listen((message) {
    //   print(message);
    // });

    webSocket = await WebSocket.connect(
      "wss://codelieche.com/ws/test/",
      headers: {
        'Connection': 'Upgrade',
        'Upgrade': 'websocket',
        'sec-websocket-version': '13',
        // 'sec-websocket-key': key,
        'Host': 'codelieche.com',
        'Origin': 'https://codelieche.com',
      },
    );

    webSocket.listen(
      (dynamic data) {
        print("接收到数据：$data");
      },
      onDone: () {
        print("onDone");
      },
      onError: (err) {
        print("onError: $err");
      },
    );

    // webSocket.add("data");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (webSocket != null && webSocket.closeCode != null) {
      webSocket.close();
    }
    print("${webSocket.closeCode}");
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(title: "基本使用"),
          // 输入框：地址，端口

          // 连接按钮
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: OutlineButton(
                    onPressed: handleSocketConnect,
                    child: Text("连接Socket"),
                  ),
                ),
              )
            ],
          ),

          // 返回的消息内容
        ],
      ),
    );

    // 包裹ScrollView
    return SingleChildScrollView(
      child: body,
    );
  }
}
