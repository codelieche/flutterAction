import 'package:flutter/material.dart';
import 'models.dart';
import 'selectValues.dart';

class SelectedModalBottomSheetDemo extends StatefulWidget {
  SelectedModalBottomSheetDemo({Key key}) : super(key: key);

  @override
  _SelectedModalBottomSheetDemoState createState() =>
      _SelectedModalBottomSheetDemoState();
}

class _SelectedModalBottomSheetDemoState
    extends State<SelectedModalBottomSheetDemo> {
  dynamic values;

  @override
  Widget build(BuildContext context) {
    // 准备弹出的选项
    List<SelectedValueItem> items = List.generate(10, (index) {
      return SelectedValueItem(
        value: index + 1,
        title: "选项 Value：${index + 1}",
      );
    });

    //
    TextStyle valueTextStyle = TextStyle(fontSize: 13, color: Colors.grey);
    return Column(children: [
      Container(
        padding: EdgeInsets.all(5),
        child: values != null
            ? Text("选择了值：$values", style: valueTextStyle)
            : Text("请点击下面的按钮，选择值！", style: valueTextStyle),
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: RaisedButton(
                onPressed: () {
                  // 从底部弹出内容
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BaseSelectValuesWidget(
                        isMultiple: false,
                        items: items,
                        values: values,
                        maxHeight: 400,
                        callback: (v) {
                          setState(() {
                            values = v;
                          });
                        },
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Text("单选"),
                    Text("【会】被键盘遮挡", style: valueTextStyle),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: RaisedButton(
                color: Colors.pinkAccent,
                textColor: Colors.white,
                onPressed: () {
                  // 从底部弹出内容
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      Widget body = BaseSelectValuesWidget(
                        isMultiple: true,
                        items: items,
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
                },
                child: Column(
                  children: [
                    Text("多选"),
                    Text(
                      "【不会】被键盘遮挡",
                      style: valueTextStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
