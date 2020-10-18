// 自定义的输入框
import 'package:flutter/material.dart';

// 基础的表单输入框
class BaseInputWidget extends StatefulWidget {
  final FocusNode focusNode; // 焦点控制
  final TextEditingController controller; // 输入控制器
  final String initialValue; // 初始化的值
  final double height; // 高度
  final bool enable; // 是否可编辑
  final Widget prefixIcon; // 输入框前面的图标，search/username/email等
  final String hintText; // placehold
  final double fontSize; // 字体大小
  final Color backgroundColor; // 背景颜色
  final double borderWidth; // 边框宽度
  final Color borderColor; // 边框颜色
  final Color focusBorderColor; // 置位焦点的时候边框颜色
  final Color enabledBorderColor; // 禁用的时候边框颜色
  final Color disabledBorderColor; // 禁用的时候边框颜色
  final double borderRadius; // 边框圆角
  final bool showClearButton; // 当有内容的时候是否显示右侧的clear
  final Function(String value) onChange; //输入框字符变更函数
  final Function(String value) onFieldSubmitted; // 当字段提交的时候
  final TextInputType keyboardType; // 键盘类型
  final Brightness keyboardAppearance; // 键盘颜色
  BaseInputWidget({
    Key key,
    this.focusNode,
    this.controller,
    this.initialValue = "",
    this.height = 35,
    this.enable = true,
    this.prefixIcon,
    this.hintText = "",
    this.fontSize = 14,
    this.backgroundColor = Colors.white,
    this.borderWidth = 1.0,
    this.borderColor = Colors.grey,
    this.focusBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.borderRadius = 3.0, // 边框圆角
    this.showClearButton = false,
    this.onChange,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text, // 键盘类型
    this.keyboardAppearance = Brightness.light, // 键盘颜色：默认白色
  }) : super(key: key);

  @override
  _BaseInputWidgetState createState() => _BaseInputWidgetState();
}

class _BaseInputWidgetState extends State<BaseInputWidget> {
  FocusNode _focusNode; // 焦点控制
  TextEditingController _textEditingController; // 输入框控制器
  bool _showClearButton = false; // 是否显示右侧的按钮

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode;
    } else {
      _focusNode = FocusNode();
    }
    if (widget.controller != null) {
      _textEditingController = widget.controller;
      if (widget.initialValue != "" && widget.controller.text == "") {
        _textEditingController.text = widget.initialValue;
      }
    } else {
      _textEditingController = TextEditingController(text: widget.initialValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Stack(
        children: [
          // 输入框
          Container(
            height: widget.height,
            child: TextFormField(
              focusNode: _focusNode,
              controller: _textEditingController,
              onChanged: (value) {
                // 传递了显示clear按钮，才处理
                if (widget.showClearButton) {
                  // 显示clear
                  if (value != "" && !_showClearButton) {
                    setState(() {
                      _showClearButton = true;
                    });
                  }
                  // 隐藏clear
                  if (value == "" && _showClearButton) {
                    setState(() {
                      _showClearButton = false;
                    });
                  }
                }
                // 调用父类传递的onChange
                if (widget.onChange != null) {
                  widget.onChange(value);
                }
              },
              onEditingComplete: () {},
              onFieldSubmitted: (value) {
                // 取消获取焦点
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                if (widget.onFieldSubmitted != null) {
                  widget.onFieldSubmitted(value);
                }
              },
              decoration: InputDecoration(
                enabled: widget.enable,
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: BoxConstraints(
                  minWidth: widget.prefixIcon == null ? 8 : widget.height,
                  maxWidth: widget.height,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 13),
                fillColor: widget.backgroundColor,
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: widget.prefixIcon != null ? 0 : 8,
                  top: 0,
                  bottom: 0,
                  right: widget.showClearButton ? widget.height : 8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: widget.enabledBorderColor != null
                        ? widget.enabledBorderColor
                        : widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: widget.disabledBorderColor != null
                        ? widget.disabledBorderColor
                        : widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: widget.focusBorderColor != null
                        ? widget.focusBorderColor
                        : widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
              style: TextStyle(
                fontSize: widget.fontSize,
                // color: Colors.black87,
              ),
              keyboardType: widget.keyboardType,
              keyboardAppearance: Brightness.light,
            ),
          ),

          // 清除按钮
          (widget.showClearButton && _showClearButton)
              ? Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      _textEditingController.text = "";
                      setState(() {
                        _showClearButton = false;
                      });
                      if (widget.onChange != null) {
                        widget.onChange("");
                      }
                    },
                    child: Container(
                      width: widget.height,
                      height: widget.height,
                      alignment: Alignment.center,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(right: 0, bottom: 0, child: Text(""))
        ],
      ),
    );

    // 返回
    return body;
  }
}
