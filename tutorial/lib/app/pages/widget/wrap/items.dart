import 'package:flutter/material.dart';

// 示例Item
class WrapDemoItem extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;

  const WrapDemoItem(
      {Key key,
      this.title,
      this.width = 100,
      this.height = 100.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      alignment: Alignment.center,
      margin: EdgeInsets.all(2),
      child: Text(title != null ? title : "$width x $height"),
    );
  }
}
