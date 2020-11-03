// 选中的值展示
import 'package:flutter/material.dart';

// 示例
import 'selectedDisplay/baseDemo.dart';
import 'selectedDisplay/selectedValuesDemo.dart';

class SelectedValuesDisplayDemoPage extends StatefulWidget {
  SelectedValuesDisplayDemoPage({Key key}) : super(key: key);

  @override
  _SelectedValuesDisplayDemoPageState createState() =>
      _SelectedValuesDisplayDemoPageState();
}

class _SelectedValuesDisplayDemoPageState
    extends State<SelectedValuesDisplayDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          // 基本样式：要实现的效果
          SelectedValuesDisplayBaseDemo(),
          // Model展示
          SelectedValueDisplayModelDemo(),

          // 示例：
        ],
      ),
    );

    body = SingleChildScrollView(
      child: body,
    );

    return body;
  }
}

class SelectedValueItemDisplayLabel extends StatelessWidget {
  final String label;
  const SelectedValueItemDisplayLabel({
    Key key,
    this.label = "标签值",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          width: 0.5,
          color: Colors.grey[400],
        ),
      ),
      child: Text(
        "$label",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
