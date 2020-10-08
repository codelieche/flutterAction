import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ShowMenuBaseDemo extends StatefulWidget {
  ShowMenuBaseDemo({Key key}) : super(key: key);

  @override
  _ShowMenuBaseDemoState createState() => _ShowMenuBaseDemoState();
}

class _ShowMenuBaseDemoState extends State<ShowMenuBaseDemo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SimpleTitleWidget(title: "基本示例"),
        ListTile(
          title: Text("有点右侧的...弹出菜单"),
          trailing: IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(size.width - 50, 50, 0, 0),
                items: [
                  PopupMenuItem(
                    child: Row(
                      children: [Icon(Icons.home), Text("首页")],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [Icon(Icons.delete), Text("删除")],
                    ),
                  )
                ],
              );
            },
          ),
        ),
        Divider(height: 5),
      ],
    );
  }
}
