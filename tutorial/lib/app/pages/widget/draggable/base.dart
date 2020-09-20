// 拖拽基本示例
import 'package:flutter/material.dart';

// 引入item
import 'items.dart';

class DraggableBaseDemoPage extends StatefulWidget {
  DraggableBaseDemoPage({Key key}) : super(key: key);

  @override
  _DraggableBaseDemoPageState createState() => _DraggableBaseDemoPageState();
}

class _DraggableBaseDemoPageState extends State<DraggableBaseDemoPage> {
  // 目标颜色
  Color _targetColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Container(
      color: Colors.grey[100],
      child: Stack(
        children: [
          DraggableDemoItem(
            offset: Offset(30, 50),
            width: 100,
            height: 100,
            color: Colors.pinkAccent,
          ),
          DraggableDemoItem(
            offset: Offset(130, 50),
            width: 100,
            height: 100,
            color: Colors.lightBlue,
          ),
          DraggableDemoItem(
            offset: Offset(230, 50),
            width: 100,
            height: 100,
            color: Colors.purpleAccent,
          ),

          // 拖拽目标
          Center(
            child: DragTarget(
              onAccept: (Color data) {
                // 接到到了Draggable传递过来的数据
                // print(data);
                setState(() {
                  _targetColor = data;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 300,
                  height: 300,
                  color: _targetColor,
                );
              },
            ),
          )
        ],
      ),
    );

    // 返回
    return body;
  }
}

// 可拖拽的Item
