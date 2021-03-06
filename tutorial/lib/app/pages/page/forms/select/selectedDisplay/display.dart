// 展示SelectedValues
// 重点文件：
// 1. models.dart
// 2. selectValues.dart
// 3. display.dart

import 'package:flutter/material.dart';
import '../../../../../variables.dart';
import '../selectValues/selectValues.dart';
import '../selectValues/models.dart';

class DisplaySelectedValues extends StatefulWidget {
  final List<SelectedValueItem> items;
  final dynamic values;
  final bool isMultiple;
  final String searchText; // 搜索提示字符
  final double maxHeight; // 弹出的选项的最大高度
  final Color activeColor; // 选择的颜色
  final Color borderColor;
  final Color backgroundColor;
  final Function(dynamic values) callback; // 回调函数【重点】
  final double displayFontSize; // 展示的文字大小
  final String displayWidgetName; // 展示组件名称，后面优化
  DisplaySelectedValues({
    Key key,
    @required this.items,
    @required this.values,
    this.searchText = "search",
    this.maxHeight = 300.0,
    this.activeColor = AppPrimaryColor,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.callback,
    this.isMultiple = false,
    this.displayFontSize = 14.0,
    this.displayWidgetName = "button",
  }) : super(key: key);

  @override
  _DisplaySelectedValuesState createState() => _DisplaySelectedValuesState();
}

class _DisplaySelectedValuesState extends State<DisplaySelectedValues> {
  var values; // 值
  List<SelectedValueItem> dataSource; // 所有的选项值

  @override
  void initState() {
    super.initState();
    if (widget.items is List) {
      setState(() {
        dataSource = widget.items;
      });
    }
    // print(widget.values);
    if (widget.isMultiple) {
      if (widget.values is List) {
        values = widget.values;
      } else {
        if (widget.values != null) {
          values = [widget.values];
        } else {
          values = [];
        }
      }
    } else {
      if (widget.values is List && widget.values.length > 0) {
        values = widget.values[0];
      } else {
        if (widget.values != null) {
          values = widget.values;
        } else {
          values = null;
        }
      }
    }
  }

  showBottomSheet() {
    // 从底部弹出内容
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        Widget body = BaseSelectValuesWidget(
          isMultiple: widget.isMultiple,
          items: dataSource,
          values: values,
          activeColor: widget.activeColor,
          maxHeight: widget.maxHeight,
          searchText: widget.searchText,
          callback: (v) {
            setState(() {
              values = v;
            });
            // 判断是否传递了callback
            if (widget.callback != null) {
              widget.callback(v);
            }
          },
        );
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              // 这个非常重要
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: body,
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(DisplaySelectedValues oldWidget) {
    // print("oldWidget: ${oldWidget.items}");
    // print("newWidget: ${widget.items}");
    if (oldWidget.items != widget.items) {
      // print("items变更了");
      dataSource = widget.items;
      // setState(() {
      //   dataSource = widget.items;
      // });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // print(values);
    // print(dataSource);
    Widget selectedValuesWidget;

    if (widget.isMultiple) {
      List<Widget> itemsWidget = [];
      for (var item in dataSource) {
        if (values is List && values.indexOf(item.value) >= 0) {
          // 添加
          itemsWidget.add(SelectedValueItemDisplayLabel(
            label: item.title,
            borderColor: widget.borderColor,
            backgroundColor: widget.backgroundColor,
          ));
        }
      }
      // print(itemsWidget);
      if (itemsWidget.length > 0) {
        selectedValuesWidget = InkWell(
          onTap: this.showBottomSheet,
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: itemsWidget,
          ),
        );
      }
    } else {
      // 单选值
      for (var item in dataSource) {
        if (item.value == values) {
          // 渲染组件
          if (widget.displayWidgetName == "text") {
            selectedValuesWidget = InkWell(
              onTap: this.showBottomSheet,
              child: Text(
                "${item.title}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: widget.displayFontSize,
                ),
              ),
            );
          } else {
            selectedValuesWidget = Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: OutlineButton(
                onPressed: this.showBottomSheet,
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "${item.title}",
                          style: TextStyle(
                            fontSize: widget.displayFontSize,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // 跳出选项
          break;
        }
      }
    }

    if (selectedValuesWidget != null) {
      return Container(
        child: selectedValuesWidget,
      );
    } else {
      return InkWell(
        onTap: this.showBottomSheet,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 8,
          ),
          child: Text(
            "无选中的值",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }
  }
}

// 展示选中的Item，已标签的样式
class SelectedValueItemDisplayLabel extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  const SelectedValueItemDisplayLabel({
    Key key,
    this.label = "标签值",
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        color: backgroundColor,
        border: Border.all(
          width: 0.5,
          // color: Colors.grey[400],
          color: borderColor,
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
