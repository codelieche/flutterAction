// 选中的值展示
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class SelectedValuesDisplayBaseDemo extends StatefulWidget {
  SelectedValuesDisplayBaseDemo({Key key}) : super(key: key);

  @override
  _SelectedValuesDisplayBaseDemoState createState() =>
      _SelectedValuesDisplayBaseDemoState();
}

class _SelectedValuesDisplayBaseDemoState
    extends State<SelectedValuesDisplayBaseDemo> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "实现样式",
          ),
          Row(
            children: [
              // 单选样式
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: OutlineButton(
                  onPressed: () {
                    print("从底部弹出选择框");
                  },
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("选中的值"),
                        ),
                        Positioned(
                          right: 0,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 多选样式
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      SelectedValueItemDisplay(label: "标签01"),
                      SelectedValueItemDisplay(label: "标签02"),
                      SelectedValueItemDisplay(label: "标签03"),
                      SelectedValueItemDisplay(label: "标签04标签04"),
                      SelectedValueItemDisplay(label: "标签05"),
                      SelectedValueItemDisplay(label: "06"),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

    // body = SingleChildScrollView(
    //   child: body,
    // );

    return body;
  }
}

class SelectedValueItemDisplay extends StatelessWidget {
  final String label;
  const SelectedValueItemDisplay({
    Key key,
    this.label = "标签值",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          width: 0.5,
          color: Colors.grey[400],
        ),
      ),
      child: Text(
        "$label",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
