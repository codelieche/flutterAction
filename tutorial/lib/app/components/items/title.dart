// 标题相关的组件
import 'package:flutter/material.dart';

import '../../variables.dart';

class SimpleTitleWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const SimpleTitleWidget(
      {Key key,
      this.title = "标题",
      this.icon = Icons.arrow_right,
      this.color = AppPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget simpleTitle = Container(
      height: 40,
      margin: EdgeInsets.all(5),
      child: Flex(direction: Axis.horizontal, children: [
        Icon(
          icon, // 默认是：Icons.arrow_right
          color: color,
        ),
        Expanded(
            child: Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)))
      ]),
      decoration: BoxDecoration(
        // 设置了decoration就不可设置Container的Color了
        color: Colors.white,
        border: Border(
          // left: BorderSide(width: 3.0, color: AppPrimaryColor),
          bottom: BorderSide(width: 1.0, color: color),
        ),
      ),
    );

    return simpleTitle;
  }
}
