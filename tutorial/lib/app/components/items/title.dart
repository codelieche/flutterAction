// 标题相关的组件
import 'package:flutter/material.dart';

import '../../variables.dart';

class SimpleTitleWidget extends StatelessWidget {
  final title;
  final IconData icon;
  final Color color;
  final String description;
  const SimpleTitleWidget(
      {Key key,
      this.title = "标题",
      this.icon = Icons.arrow_right,
      this.color = AppPrimaryColor,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // title可能是字符，也可能是Widget
    Widget titleWidget;
    if (title is String) {
      titleWidget = Text(title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
    } else {
      titleWidget = title;
    }

    // 简单的标题组件
    Widget simpleTitle = Container(
      height: 40,
      margin: description == null
          ? EdgeInsets.all(5)
          : EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Flex(direction: Axis.horizontal, children: [
        Icon(
          icon, // 默认是：Icons.arrow_right
          color: color,
        ),
        Expanded(child: titleWidget)
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

    // 描述内容
    if (description != null) {
      // 标题下面有点描述
      Widget descriptionWidget = Container(
        padding: EdgeInsets.fromLTRB(5, 3, 3, 3),
        margin: EdgeInsets.only(left: 5, bottom: 5, right: 5),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Text(
              description,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              textAlign: TextAlign.left,
            ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border(
              left: BorderSide(width: 4, color: Colors.grey[400]),
              // left: BorderSide(width: 4, color: color),
            )),
      );
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          simpleTitle,
          descriptionWidget,
        ],
      );
    } else {
      // 无描述的标题
      return simpleTitle;
    }
  }
}
