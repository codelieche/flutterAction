// 弹出文本输入框
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/base/toast.dart';
import 'package:tutorial/app/components/items/title.dart';

class ShowModalBottomSheetTextFieldDemo extends StatefulWidget {
  ShowModalBottomSheetTextFieldDemo({Key key}) : super(key: key);

  @override
  _ShowModalBottomSheetTextFieldDemoState createState() =>
      _ShowModalBottomSheetTextFieldDemoState();
}

class _ShowModalBottomSheetTextFieldDemoState
    extends State<ShowModalBottomSheetTextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //  标题
          SimpleTitleWidget(
            title: "弹出输入框",
          ),

          _TextFieldDemo(needPop: false),

          Divider(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      Widget body = _TextFieldDemo();
                      return body;
                    },
                  );
                },
                child: Column(
                  children: [
                    Text("弹出TextField"),
                    Text(
                      "会被键盘遮住",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // 示例2
              RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      Widget body = _TextFieldDemo();

                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: body,
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Text("弹出TextField"),
                    Text(
                      "不会被键盘遮住",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _TextFieldDemo extends StatefulWidget {
  final bool needPop;
  _TextFieldDemo({Key key, this.needPop = true}) : super(key: key);

  @override
  __TextFieldDemoState createState() => __TextFieldDemoState();
}

class __TextFieldDemoState extends State<_TextFieldDemo> {
  String value = "";
  FocusNode _inputFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.white,
      child: Row(
        children: [
          // 左边输入框
          Container(
            width: size.width * 0.5,
            margin: EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey[400],
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  // color: Colors.red.withOpacity(0.1),
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                  child: TextField(
                    focusNode: _inputFocusNode,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      fillColor: Colors.green.withOpacity(0.1),
                      // contentPadding: EdgeInsets.only(
                      //   bottom: 12,
                      //   left: 10,
                      //   right: 10,
                      // ),
                      hintText: "search",
                      hintStyle: TextStyle(fontSize: 13),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    onChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                  ),
                ),
                // 清除
                Positioned(
                  top: 0,
                  right: 0,
                  child: value != ""
                      ? InkWell(
                          child: Container(
                            width: 20,
                            height: 35,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.close,
                              size: 12,
                            ),
                          ),
                          onTap: () {
                            _textEditingController.text = "";
                            setState(() {
                              value = "";
                            });
                          },
                        )
                      : Text(""),
                )
              ],
            ),
          ),
          // 右边按钮
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: OutlineButton(
                        onPressed: () {
                          if (_inputFocusNode.hasFocus) {
                            _inputFocusNode.unfocus();
                          }
                          showToastMessage(
                            "取消输入内容",
                          );
                          if (widget.needPop) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("取消"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: OutlineButton(
                        onPressed: () {
                          if (_inputFocusNode.hasFocus) {
                            _inputFocusNode.unfocus();
                          }
                          showToastMessage(
                            "输入的内容是：${_textEditingController.text}",
                          );
                          if (widget.needPop) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("确认"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
