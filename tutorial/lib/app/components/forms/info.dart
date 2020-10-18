import 'package:flutter/material.dart';

// 信息展示样式01
class InfoDisplayStyle01 extends StatelessWidget {
  final TextAlign textAlign;
  final String title;
  final String value;
  final double titleWidth; // 标题的宽度
  final Widget valueWidget; // 值也可使用自定义的组件
  final bool isFirst; // 是否是首行
  final Alignment titleAlignment; // 标题对其方式
  final Alignment valueAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double borderWidth;
  final Color borderColor; // 边框颜色
  final Color backgroundColor; // 背景色
  final double fontSize;
  final Color textColor; // 文本颜色
  const InfoDisplayStyle01({
    Key key,
    @required this.title,
    this.value,
    this.titleWidth = 100,
    this.valueWidget,
    this.isFirst = false, // 是否是首行，首行需要渲染上面的边框
    this.textAlign = TextAlign.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleAlignment = Alignment.topLeft,
    this.valueAlignment = Alignment.topLeft,
    this.borderWidth = 0.5,
    this.fontSize = 14,
    this.textColor = const Color.fromRGBO(108, 108, 108, 1),
    this.borderColor = const Color.fromRGBO(203, 204, 205, 1),
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: isFirst
              ? BorderSide(
                  width: borderWidth,
                  color: borderColor,
                )
              : BorderSide.none,
          left: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
          right: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
          bottom: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Container(
            width: titleWidth,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            alignment: titleAlignment,
            child: Text(
              "$title",
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              alignment: valueAlignment,
              child: valueWidget != null
                  ? valueWidget
                  : SelectableText(
                      "$value",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: fontSize, color: textColor),
                    ),
              decoration: BoxDecoration(
                // color: backgroundColor,
                border: Border(
                  left: BorderSide(
                    width: borderWidth,
                    color: borderColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
