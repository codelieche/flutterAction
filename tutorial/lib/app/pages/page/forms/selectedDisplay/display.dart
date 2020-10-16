import 'package:flutter/material.dart';
import '../selectValues/selectValues.dart';
import '../selectValues/models.dart';

class DisplaySelectedValues extends StatefulWidget {
  final List<SelectedValueItem> items;
  final dynamic values;
  final bool isMultiple;
  final Color borderColor;
  final Color backgroundColor;
  DisplaySelectedValues({
    Key key,
    @required this.items,
    @required this.values,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.isMultiple = false,
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
          activeColor: Colors.pinkAccent,
          callback: (v) {
            setState(() {
              values = v;
            });
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
            label: item.label,
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
      for (var item in dataSource) {
        if (item.value == values) {
          // 渲染组件
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
                      child: Text("${item.label}"),
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
