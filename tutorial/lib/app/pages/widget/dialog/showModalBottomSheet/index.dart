// showModalBottomSheet Demo Page
import 'package:flutter/material.dart';

// 引入demo
import './base.dart';

class ShowModalBottomSheetIndexPage extends StatefulWidget {
  ShowModalBottomSheetIndexPage({Key key}) : super(key: key);

  @override
  _ShowModalBottomSheetIndexPageState createState() =>
      _ShowModalBottomSheetIndexPageState();
}

class _ShowModalBottomSheetIndexPageState
    extends State<ShowModalBottomSheetIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 页面内容
    Widget body = Column(
      children: [
        // 基本使用
        ShowModalBottomSheetBaseDemo(),
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}
