import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 引入provider
import 'provider/counter.dart';

class ProviderTestDemoPage extends StatefulWidget {
  ProviderTestDemoPage({Key key}) : super(key: key);

  @override
  _ProviderTestDemoPageState createState() => _ProviderTestDemoPageState();
}

class _ProviderTestDemoPageState extends State<ProviderTestDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 获取provider
    var _conterProvider = context.watch<ExampleProviderCounter>();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text("测试页:${_conterProvider.count}"),
        ),
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                color: Colors.pinkAccent,
                textColor: Colors.white,
                child: Text("add"),
                onPressed: () {
                  _conterProvider.increment();
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
