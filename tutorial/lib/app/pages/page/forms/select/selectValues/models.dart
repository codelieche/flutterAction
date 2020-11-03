import 'package:flutter/material.dart';

class SelectedValueItem {
  dynamic value; // 选项的值
  String title; // 展示的标题
  String subTitle; // 子标题

  SelectedValueItem({
    @required this.value,
    @required this.title,
    this.subTitle,
  });

  bool containsString(String value) {
    return "${this.value}${this.title}"
            .toLowerCase()
            .indexOf(value.toLowerCase()) >=
        0;
  }
}
