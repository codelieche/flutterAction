import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import './selectValues/selectValues.dart';

import './selectValues/models.dart';

class SelecteValuesBaseDemo extends StatefulWidget {
  SelecteValuesBaseDemo({Key key}) : super(key: key);

  @override
  _SelecteValuesBaseDemoState createState() => _SelecteValuesBaseDemoState();
}

class _SelecteValuesBaseDemoState extends State<SelecteValuesBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 准备示例items
    List<SelectedValueItem> items = [];
    for (var i = 0; i < 10; i++) {
      var item = SelectedValueItem(value: i, title: "Value: $i");
      items.add(item);
    }
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "SelectValues基本示例",
            description: "多选：CheckboxListTile",
          ),
          BaseSelectValuesWidget(
            isMultiple: true,
            values: 3,
            items: items,
          ),
          SizedBox(
            height: 20,
          ),
          SimpleTitleWidget(
            title: "SelectValues基本示例2",
            description: "多选：RadioListTile",
          ),
          BaseSelectValuesWidget(
            isMultiple: false,
            values: 3,
            items: items,
            activeColor: Colors.pinkAccent,
            searchText: "search user",
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      child: body,
    );
  }
}
