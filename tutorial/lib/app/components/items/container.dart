import 'package:flutter/material.dart';

// 示例ContainerItem
class ContainerItem extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  final double margin;

  const ContainerItem(
      {Key key,
      this.title,
      this.width = 100,
      this.height = 100.0,
      this.color = Colors.grey,
      this.margin = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin),
      child: Text(title != null ? title : "$width x $height"),
    );
  }
}
