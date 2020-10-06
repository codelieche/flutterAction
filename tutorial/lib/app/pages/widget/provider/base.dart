import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 引入provider
import './provider/counter.dart';

class ProviderBaseDemo extends StatefulWidget {
  ProviderBaseDemo({Key key}) : super(key: key);

  @override
  _ProviderBaseDemoState createState() => _ProviderBaseDemoState();
}

class _ProviderBaseDemoState extends State<ProviderBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 获取provider
    var _conterProvider = context.watch<ExampleProviderCounter>();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text("Base页:${_conterProvider.count}"),
        ),
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                color: Colors.lightBlue,
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
