// Loading组件
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final String message; // 提示信息文字
  final double imageWidth; // 图片的宽高
  final Axis direction; // 布局方式
  LoadingWidget({
    Key key,
    this.message = "加载中...",
    this.imageWidth = 22.0,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    // 先判断方向
    if (widget.direction == Axis.vertical) {
      // 垂直方向，文字在下面
      return Container(
        alignment: Alignment.center, // 居中对齐
        padding: EdgeInsets.all(5),
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widget.imageWidth,
              height: widget.imageWidth,
              child: Image.asset("asserts/images/loading.gif"),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                widget.message,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            )
          ],
        ),
      );
    } else {
      // 左右布局：文字在右侧
      return Container(
        alignment: Alignment.center, // 居中对齐
        padding: EdgeInsets.all(5),
        // color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: widget.imageWidth,
              height: widget.imageWidth,
              child: Image.asset("asserts/images/loading.gif"),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                widget.message,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            )
          ],
        ),
      );
    }
  }
}
