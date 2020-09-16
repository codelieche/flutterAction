// 屏幕适配器

import 'package:flutter/material.dart';

import './screenutil.dart';

class ScreenAdapter {
  static init(context) {
    // 初始化
    ScreenUtil.init(context);
    print("uiWidthPx: ${ScreenUtil().uiWidthPx}");
    print("width: ${MediaQuery.of(context).size.width}");
    print("height: ${MediaQuery.of(context).size.height}");

    print("uiHeightPx:${ScreenUtil().uiHeightPx}");
  }

  // 设置Widget的高度
  static setHeight(num value) {
    return ScreenUtil().setHeight(value);
  }

  // 设置Widget的宽度
  static setWidth(num value) {
    return ScreenUtil().setWidth(value);
  }
}
