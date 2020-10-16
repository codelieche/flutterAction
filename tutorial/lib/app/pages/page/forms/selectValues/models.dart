import 'package:flutter/material.dart';

class SelectedValueItem {
  dynamic value; // 选项的值
  String label; // 展示的标签

  SelectedValueItem({@required this.value, @required this.label});

  bool containsString(String value) {
    return "${this.value}${this.label}"
            .toLowerCase()
            .indexOf(value.toLowerCase()) >=
        0;
  }
}
