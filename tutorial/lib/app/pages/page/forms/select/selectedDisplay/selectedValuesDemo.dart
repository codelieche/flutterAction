import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

import '../selectValues/models.dart';
import 'apiDisplay.dart';
import 'display.dart';

class SelectedValueDisplayModelDemo extends StatefulWidget {
  SelectedValueDisplayModelDemo({Key key}) : super(key: key);

  @override
  _SelectedValueDisplayModelDemoState createState() =>
      _SelectedValueDisplayModelDemoState();
}

class _SelectedValueDisplayModelDemoState
    extends State<SelectedValueDisplayModelDemo> {
  @override
  Widget build(BuildContext context) {
    List<SelectedValueItem> items = List.generate(10, (index) {
      return SelectedValueItem(
        value: index + 1,
        title: "Value: ${index + 1}",
        subTitle: "sub title ${index + 1}",
      );
    });

    dynamic values = [];

    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "展示SelectedValueItem",
            description: "DisplaySelectedValues[单选]",
          ),
          Container(
            child: Wrap(
              children: [
                DisplaySelectedValues(
                  items: items,
                  values: values,
                  isMultiple: false,
                ),
                DisplaySelectedValues(
                  items: items,
                  values: [5],
                  isMultiple: false,
                ),
                DisplaySelectedValues(
                  items: items,
                  values: null,
                  isMultiple: false,
                ),
              ],
            ),
          ),
          SimpleTitleWidget(
            title: "展示SelectedValueItem",
            description: "DisplaySelectedValues[多选]",
          ),
          Container(
            child: Wrap(
              children: [
                DisplaySelectedValues(
                  items: items,
                  values: values,
                  isMultiple: true,
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Wrap(
              children: [
                DisplaySelectedValues(
                  items: items,
                  values: [2, 4],
                  isMultiple: true,
                  borderColor: Colors.grey[400],
                  backgroundColor: Colors.pink[100].withOpacity(0.6),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: DisplaySelectedValues(
              items: items,
              values: [1, 5, 10],
              isMultiple: true,
              borderColor: Colors.grey[400],
              backgroundColor: Colors.green[100].withOpacity(0.6),
              callback: (v) {
                // 当弹出的选择框确定之后，就会执行这个函数糊了
                // 输出值
                print("值变更了：$v");
              },
            ),
          ),

          Divider(),

          // ApiListDataDisplay
          SimpleTitleWidget(
            title: "根据API设置SelectedValue",
            description: "ApiListDataDisplaySelectedValues",
          ),

          Container(
            child: ApiListDataDisplaySelectedValues(
              url: "https://api.github.com/repos/flutter/flutter/branches",
              valueKey: "name",
              titleKey: "name",
              subTitleKey: "name",
              borderColor: Colors.grey[200],
              backgroundColor: Colors.pinkAccent.withOpacity(0.5),
              isMultiple: false,
              displayWidgetName: "button",
              callback: (values) {
                print(values);
              },
            ),
          )
        ],
      ),
    );

    return body;
  }
}
