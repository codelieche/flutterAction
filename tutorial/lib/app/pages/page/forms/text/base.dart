// 页面表单文本输入相关的示例

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/variables.dart';

class PageFormsTextBaseDemoPage extends StatefulWidget {
  PageFormsTextBaseDemoPage({Key key}) : super(key: key);

  @override
  _PageFormsTextBaseDemoPageState createState() =>
      _PageFormsTextBaseDemoPageState();
}

class _PageFormsTextBaseDemoPageState extends State<PageFormsTextBaseDemoPage> {
  FocusNode _searchFocusNode = FocusNode();
  FocusNode _searchFocusNode2 = FocusNode();

  TextEditingController _searchTextController = TextEditingController();
  TextEditingController _searchTextController2 = TextEditingController();

  bool _searchShowClear = false;
  bool _searchShowClear2 = false;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Container(
      color: Colors.white,
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "TextField",
            description: "search input,可剥离出来成自定义的TextField",
          ),

          // 搜索输入框
          Row(
            children: [
              Expanded(
                child: Container(
                  // Search外面包裹的容器
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Stack(
                    children: [
                      Container(
                        // TextField外面的边框背景色容器
                        height: 30,
                        alignment: Alignment.center,

                        // padding: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey[400],
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          focusNode: _searchFocusNode,
                          controller: _searchTextController,
                          enabled: true,
                          onChanged: (value) {
                            // 显示clear
                            if (value != "" && !_searchShowClear) {
                              setState(() {
                                _searchShowClear = true;
                              });
                            }
                            // 隐藏clear
                            if (value == "" && _searchShowClear) {
                              setState(() {
                                _searchShowClear = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 30, // 当有prefixIcon的时候就为高的值，当没有的时候就设置为10
                              maxWidth: 30,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.black45,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            hintText: "search",
                            hintStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),

                      // clear button
                      _searchShowClear
                          ? Positioned(
                              top: 0,
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  _searchTextController.text = "";
                                  setState(() {
                                    _searchShowClear = false;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 1,
                              height: 1,
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),

          // TextFormField
          SimpleTitleWidget(
            title: "TextFormField",
            description: "search input, 可剥离成自定义组件",
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    //  search输入框
                    Container(
                      // 限制输入框的高度
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      height: 35,
                      child: TextFormField(
                        focusNode: _searchFocusNode2,
                        controller: _searchTextController2,
                        // initialValue: "初始化的内容",
                        // enabled: false,
                        onChanged: (value) {
                          // 显示clear
                          if (value != "" && !_searchShowClear2) {
                            setState(() {
                              _searchShowClear2 = true;
                            });
                          }
                          // 隐藏clear
                          if (value == "" && _searchShowClear2) {
                            setState(() {
                              _searchShowClear2 = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          // enabled: false,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                            color: Colors.black54,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 35,
                            minHeight: 35,
                          ),
                          contentPadding: EdgeInsets.only(
                            top: 2,
                            left: 8,
                            right: 25,
                            bottom: 2,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: BorderSide(
                              color: Colors.grey[400],
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey[400],
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppPrimaryColor,
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    // 清楚按钮
                    _searchShowClear2
                        ? Positioned(
                            top: 0,
                            right: 5,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                _searchTextController2.text = "";
                                setState(() {
                                  _searchShowClear2 = false;
                                });
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[500],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.close,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                        : Positioned(
                            right: 0,
                            child: SizedBox(
                              width: 1,
                              height: 1,
                            ),
                          ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}
