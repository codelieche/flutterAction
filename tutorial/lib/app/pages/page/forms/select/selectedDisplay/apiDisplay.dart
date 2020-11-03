// 通过Api获取到列表数据，然后通过DisplaySelectedValues展示出来
// 这个非常的弹性，多处可复用

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/app/utils/fetchApi/base.dart';

import '../selectValues/models.dart';
import '../../../../../variables.dart';
import 'display.dart';

class ApiListDataDisplaySelectedValues extends StatefulWidget {
  final String url; // 获取的数据接口Url
  final String listDataKey; // 返回的结果列表key，比如DRF的results, 可以是多级别的，比如：user.groups
  final bool isMultiple; // 是单选还是多选
  final Color borderColor; // 多选的tag值的边框颜色
  final Color backgroundColor; // 多选的tag的背景颜色
  final String searchText; // 搜索提示字符
  final double maxHeight; // 弹出的选项的最大高度
  final Color activeColor; // 选择的颜色
  final Function(dynamic values) callback; // 回调函数【重点】
  final String nullValueTitle; // 全部选择/取消选择
  final String valueKey; // 列表的value的key
  final String titleKey; // 列表的title的key
  final String subTitleKey; // 列表的subTitle的key
  final double displayFontSize; // 选择的值的文字大小
  final String displayWidgetName; // 选择的值展示，使用Text还是OutlineButton

  ApiListDataDisplaySelectedValues({
    Key key,
    @required this.url,
    this.listDataKey = "results",
    this.searchText = "search",
    this.maxHeight = 300.0,
    this.activeColor = AppPrimaryColor,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.callback,
    this.isMultiple = false,
    this.nullValueTitle,
    this.valueKey,
    this.titleKey,
    this.subTitleKey,
    this.displayWidgetName = "text",
    this.displayFontSize = 14.0,
  }) : super(key: key);

  @override
  _DisplaySelectedValuesState createState() => _DisplaySelectedValuesState();
}

class _DisplaySelectedValuesState
    extends State<ApiListDataDisplaySelectedValues> {
  List<SelectedValueItem> items = []; // 列表数据
  dynamic values = "";

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  // 获取列表数据
  fetchData() async {
    // 发起请求
    if (widget.url == null || widget.url == "") {
      return;
    }
    try {
      // 对api发起请求
      Response response = await fetchApi.get(widget.url);

      // 响应码是200
      if (response.statusCode == 200) {
        var data = response.data;

        var results = [];

        // 如果返回的结果是个字典类型，则需要使用listDataKey来获取列表数据
        // 如果是多级列表，则需要对.做处理
        List listDataKeys = widget.listDataKey.split(".");
        if (data is Map && data.containsKey(listDataKeys[0])) {
          // 得到数组就不处理了

          for (var i = 0; i < listDataKeys.length; i++) {
            data = data[listDataKeys[i]];

            // 如果这一层不是List，是Map继续
            if (data is Map) {
              // 进入下一层
              continue;
            } else if (data is List) {
              results = data;
              break;
            } else {
              print("当前层级的数据有误");
            }
          }
        } else if (data is List) {
          // data是列表，就直接赋值
          results = data;
        }

        if (data.length > 0 && widget.nullValueTitle != null) {
          var itemObj = SelectedValueItem(
            value: "",
            title: widget.nullValueTitle != null
                ? "${widget.nullValueTitle}"
                : "空值",
          );
          items.add(itemObj);
        }

        // 遍历值
        for (var item in results) {
          if (item is Map && item.containsKey(widget.valueKey)) {
            var itemObj = SelectedValueItem(
              value: item[widget.valueKey],
              title: item.containsKey(widget.titleKey)
                  ? item[widget.titleKey]
                  : "${item[widget.valueKey]}",
              subTitle: widget.subTitleKey != null &&
                      item.containsKey(widget.subTitleKey)
                  ? "${item[widget.subTitleKey]}"
                  : null,
            );

            items.add(itemObj);
          }
        }
        // 修改状态
        setState(() {
          items = items;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) {
      return Container();
    }

    // 使用：DisplaySelectedValues组件
    return DisplaySelectedValues(
      values: values, // 选择的值
      items: items, // 所有选项列表
      searchText: widget.searchText,
      maxHeight: widget.maxHeight,
      activeColor: widget.activeColor,
      borderColor: widget.borderColor,
      backgroundColor: widget.backgroundColor,
      callback: widget.callback,
      isMultiple: widget.isMultiple,
      displayFontSize: widget.displayFontSize,
      displayWidgetName: widget.displayWidgetName,
    );
  }
}
