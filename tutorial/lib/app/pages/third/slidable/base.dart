import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tutorial/app/components/items/title.dart';

class FlutterSlidableBaseDemoPage extends StatefulWidget {
  FlutterSlidableBaseDemoPage({Key key}) : super(key: key);

  @override
  _FlutterSlidableBaseDemoPageState createState() =>
      _FlutterSlidableBaseDemoPageState();
}

class _FlutterSlidableBaseDemoPageState
    extends State<FlutterSlidableBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SimpleTitleWidget(
          title: "左滑",
          description: "secondaryActions",
        ),

        // 左滑显示删除
        Slidable(
          child: ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("左滑显示删除"),
          ),
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: "删除",
              color: Colors.redAccent,
              icon: Icons.delete,
              onTap: () {
                print("点击了删除");
              },
            )
          ],
        ),

        Divider(),

        // 左滑显示删除和更多
        Slidable(
          child: ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("左滑显示更多和删除"),
          ),
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: "more",
              color: Colors.blueGrey,
              icon: Icons.more_horiz,
              onTap: () {
                print("显示更多");
              },
            ),
            IconSlideAction(
              caption: "删除",
              color: Colors.redAccent,
              icon: Icons.delete,
              onTap: () {
                print("点击了删除");
              },
            )
          ],
        ),
        Divider(),

        // 右滑
        SimpleTitleWidget(
          title: "右滑",
          description: "actions: []",
        ),

        // 左滑显示删除
        Slidable(
          child: ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("右滑显示分享"),
          ),
          actionPane: SlidableScrollActionPane(),
          actions: [
            IconSlideAction(
              caption: "分享",
              color: Colors.blueAccent,
              icon: Icons.share,
              onTap: () {
                print("点击了分享");
              },
            )
          ],
        ),

        Divider(),

        // 左右滑
        SimpleTitleWidget(
          title: "左右滑",
          description: "actions: [], secondaryActions: []",
        ),

        // 左滑显示删除
        Slidable(
          child: ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("右滑显示分享,左滑删除和更多"),
          ),
          actionPane: SlidableScrollActionPane(),
          actions: [
            IconSlideAction(
              caption: "分享",
              color: Colors.blueAccent,
              icon: Icons.share,
              onTap: () {
                print("点击了分享");
              },
            )
          ],
          secondaryActions: [
            IconSlideAction(
              caption: "more",
              color: Colors.blueGrey,
              icon: Icons.more_horiz,
              onTap: () {
                print("显示更多");
              },
            ),
            IconSlideAction(
              caption: "删除",
              color: Colors.redAccent,
              icon: Icons.delete,
              onTap: () {
                print("点击了删除");
              },
            )
          ],
        ),
      ],
    );
  }
}
