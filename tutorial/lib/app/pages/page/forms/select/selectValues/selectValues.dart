// 这个组件主要是，为了弹出选择框，选择单选/多选的内容
// 需要配置的参数：items: List<Map<String, dynamic>>

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/base/toast.dart';
import 'package:tutorial/app/variables.dart';

import 'models.dart';

class BaseSelectValuesWidget extends StatefulWidget {
  final bool isMultiple; // 是单选的还是多选的
  final dynamic values; // 默认的值【重点】
  final List<SelectedValueItem> items; // 选项列表【重点】
  final String searchText; // 搜索提示字符
  final double maxHeight; // 弹出的选项的最大高度
  final Color activeColor; // 选择的颜色
  final Function(dynamic values) callback; // 回调函数【重点】
  BaseSelectValuesWidget({
    Key key,
    this.isMultiple = false,
    @required this.values,
    @required this.items,
    this.searchText = "search",
    this.maxHeight = 300.0,
    this.activeColor = AppPrimaryColor,
    this.callback, // 回调函数
  }) : super(key: key);

  @override
  _BaseSelectValuesWidgetState createState() => _BaseSelectValuesWidgetState();
}

class _BaseSelectValuesWidgetState extends State<BaseSelectValuesWidget> {
  var values; // 值
  List<SelectedValueItem> dataSource = [];
  String searchValue = ""; // 搜索的值
  FocusNode _inputFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

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
    // 滚动事件
    _scrollController.addListener(() {
      if (_scrollController.offset > 0) {
        _inputUnFocus();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  filterItems(String value) {
    if (value == "") {
      dataSource = widget.items;
    } else {
      dataSource = [];
      for (var item in widget.items) {
        if (item.containsString(value)) {
          dataSource.add(item);
        }
      }
    }
    // 重新赋值
    setState(() {
      dataSource = dataSource;
    });
  }

  // 确认函数
  handleSelectedCallBack() {
    // 当点击了确定之后，执行回调函数
    if (widget.callback != null) {
      widget.callback(values);
    } else {
      // 弹出消息
      showToastMessage(
        "选择的值为：$values",
        type: ToastMessageType.message,
        gravity: ToastGravity.BOTTOM,
      );

      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("选择的值为：$values"),
      //     duration: Duration(seconds: 2),
      //   ),
      // );
    }
    // 返回
    Navigator.of(context).pop(values);
  }

  _inputUnFocus() {
    if (_inputFocusNode.hasFocus) {
      _inputFocusNode.unfocus();
    }
  }

  // 构建可现实的列表
  ListView buildListViewWidget() {
    ListView listView;
    if (widget.isMultiple) {
      // 多选
      listView = ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) {
          return Divider(height: 2);
        },
        itemBuilder: (context, index) {
          SelectedValueItem item = dataSource[index];
          // print("index: $index  ===> ${item.value}");
          return CheckboxListTile(
            dense: true,
            activeColor: widget.activeColor,
            value: values.indexOf(item.value) >= 0,
            selected: values.indexOf(item.value) >= 0,
            onChanged: (checked) {
              if (checked) {
                this._inputUnFocus(); // 取消搜索框的焦点
                if (values.indexOf(item.value) < 0) {
                  values.add(item.value);
                  setState(() {
                    values = values;
                  });
                }
              } else {
                // 取消选择
                if (values.indexOf(item.value) >= 0) {
                  values.remove(item.value);
                  setState(() {
                    values = values;
                  });
                }
              }
            },
            title: Text(item.title),
            subtitle: item.subTitle != null ? Text(item.subTitle) : null,
          );
        },
        itemCount: dataSource.length,
      );
    } else {
      // 单选
      listView = ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) {
          return Divider(height: 2);
        },
        itemBuilder: (context, index) {
          SelectedValueItem item = dataSource[index];
          // print("index: $index  ===> ${item.value}");
          return RadioListTile(
            dense: true,
            activeColor: widget.activeColor,
            value: item.value,
            selected: item.value == this.values,
            groupValue: this.values,
            onChanged: (value) {
              this._inputUnFocus(); // 取消搜索框的焦点
              setState(() {
                values = value;
              });
            },
            // title: Text(item.label, style: TextStyle(fontSize: 14)),
            title: Text(item.title),
            subtitle: item.subTitle != null ? Text(item.subTitle) : null,
          );
        },
        itemCount: dataSource.length,
      );
    }

    // 返回
    return listView;
  }

  // 是多选的时候，底部有个全选和反选的按钮
  Widget buildCheckBoxBottomButtonWidget() {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.end,
      children: [
        Container(
          height: 30,
          child: OutlineButton(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            onPressed: () {
              if (widget.isMultiple && values is List) {
                var newValues = [];
                for (var item in dataSource) {
                  if (values.indexOf(item.value) < 0) {
                    newValues.add(item.value);
                  }
                }
                setState(() {
                  values = newValues;
                });
              }
            },
            child: Text(
              "反选",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
        ),
        Container(
          height: 30,
          child: OutlineButton(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            onPressed: () {
              // 全部选择
              if (widget.isMultiple) {
                values = [];
                for (var item in dataSource) {
                  values.add(item.value);
                }
                setState(() {
                  values = values;
                });
              }
            },
            child: Text(
              "全选",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(values);
    // 选项元素
    Widget listView;
    // 判断items是否数组
    // if (widget.items is List && widget.items.length > 0) {
    if (dataSource is List && dataSource.length > 0) {
      // 先判断是多选还是单选的
      listView = this.buildListViewWidget();
    } else {
      // 没有选项
      listView = Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Text(
          "无选项",
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: widget.maxHeight,
      ),
      child: Column(
        children: [
          // 顶部：搜索 + 2个按钮
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 0.5, color: Colors.grey[400]),
                bottom: BorderSide(width: 0.5, color: Colors.grey[400]),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      // border: Border.all(width: 1, color: Colors.grey[200]),
                    ),
                    child: TextField(
                      focusNode: _inputFocusNode,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "${widget.searchText}",
                        hintStyle: TextStyle(fontSize: 13),
                        contentPadding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 5,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.pinkAccent,
                        //     width: 0.5,
                        //   ),
                        // ),
                      ),
                      style: TextStyle(fontSize: 14),
                      onChanged: (value) {
                        this.filterItems(value);
                      },
                      onSubmitted: (value) {
                        if (_inputFocusNode.hasFocus) {
                          _inputFocusNode.unfocus();
                        }
                        setState(() {
                          searchValue = value;
                        });
                        // 过滤数据
                        this.filterItems(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: OutlineButton(
                            onPressed: () {
                              // 取消搜索框的焦点
                              if (_inputFocusNode.hasFocus) {
                                _inputFocusNode.unfocus();
                              }
                              // 记得返回
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "取消",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: RaisedButton(
                            color: widget.activeColor,
                            textColor: Colors.white,
                            onPressed: () {
                              // 取消搜索框的焦点
                              if (_inputFocusNode.hasFocus) {
                                _inputFocusNode.unfocus();
                              }
                              this.handleSelectedCallBack();
                            },
                            child: Text(
                              "确定",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 列表选项
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: listView,
            ),
          ),
          // 当前选中的值

          // 底部，全选
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              // border: Border(
              //   // top: BorderSide(width: 0.5, color: Colors.grey[200]),
              // ),
            ),
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "${values != null && values != [] ? "当前选中的值为：$values" : "请选择"}",
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                widget.isMultiple
                    ? buildCheckBoxBottomButtonWidget()
                    : SizedBox(width: 1, height: 1)
              ],
            ),
          )
        ],
      ),
    );
  }
}
