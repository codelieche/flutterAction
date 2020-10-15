// BaseSelectValuesWidget示例使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 导入BaseSelectValuesWidget
import './selectValues.dart';
import 'bottomSheet.dart';

class BaseSelectValuesWidgetDemoPage extends StatefulWidget {
  BaseSelectValuesWidgetDemoPage({Key key}) : super(key: key);

  @override
  _BaseSelectValuesWidgetDemoPageState createState() =>
      _BaseSelectValuesWidgetDemoPageState();
}

class _BaseSelectValuesWidgetDemoPageState
    extends State<BaseSelectValuesWidgetDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "底部弹出选择框",
          ),
          SelectedBottomSheetDemo(),
        ],
      ),
    );

    // 包裹滑动
    body = SingleChildScrollView(
      child: body,
    );

    // 返回
    return body;
  }
}
