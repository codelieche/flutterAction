// ListView基本使用
import 'package:flutter/material.dart';
// import 'package:tutorial/app/components/items/title.dart';

class ListViewDemo01Page extends StatefulWidget {
  ListViewDemo01Page({Key key}) : super(key: key);

  @override
  _ListViewDemo01PageState createState() => _ListViewDemo01PageState();
}

class _ListViewDemo01PageState extends State<ListViewDemo01Page> {
  List<Widget> items;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    items = List.generate(5, (index) {
      String title = "标题${index + 1}";
      return _ListItemDemo(title: title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 添加
        Container(
          color: Colors.lightBlue[400],
          alignment: Alignment.center,
          child: ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.white,
            ),
            title: Text(
              "添加",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              var newItem = _ListItemDemo(title: "标题${items.length + 1}");
              setState(() {
                items.add(newItem);
                this
                    ._scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent);
              });
            },
          ),
        ),

        // 列表
        Container(
          height: 500,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.all(5),
            children: [
              // item元素列表
              ...items,
            ],
          ),
        )
      ],
    );
  }
}

class _ListItemDemo extends StatelessWidget {
  final String title;
  const _ListItemDemo({Key key, this.title = "默认标题"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(title),
      onTap: () {
        showDialog(
            context: context,
            child: AlertDialog(
              content: Text(title),
            ));
      },
    );
  }
}
