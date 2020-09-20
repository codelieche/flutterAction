// 可拖拽的item
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class DraggableDemoItem extends StatefulWidget {
  // 位置信息
  final Offset offset;
  // 需要传递，width、height、color
  final double width;
  final double height;
  final Color color;

  DraggableDemoItem({
    Key key,
    this.offset,
    this.width = 100,
    this.height = 100,
    this.color = AppPrimaryColor,
  }) : super(key: key);

  @override
  _DraggableDemoItemState createState() => _DraggableDemoItemState();
}

class _DraggableDemoItemState extends State<DraggableDemoItem> {
  // 位置信息
  Offset _offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          width: widget.width,
          height: widget.height,
          color: widget.color,
        ),
        feedback: Container(
          // 拖拽的时候
          width: widget.width,
          height: widget.height,
          color: widget.color.withOpacity(0.5),
        ),
        onDragCompleted: () {
          print("Drap 完成！");
        },
        onDraggableCanceled: (velocity, offset) {
          // print(velocity);
          print(offset);
          // 拖拽完成
          setState(() {
            // 因为参数有个offset，前面的是对象的offset
            // _offset = offset;
            _offset = Offset(offset.dx, offset.dy - 150);
          });
        },
        onDragEnd: (detail) {
          print("onDragEnd: ${detail.offset}");
        },
      ),
    );
  }
}
