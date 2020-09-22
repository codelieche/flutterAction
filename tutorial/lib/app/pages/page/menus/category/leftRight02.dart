// 左右布局的分类:Demo02
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/loading.dart';
import 'package:tutorial/app/utils/screen/adapter.dart';
import 'package:tutorial/app/variables.dart';

class CategoryLeftRightDemo02Page extends StatefulWidget {
  CategoryLeftRightDemo02Page({Key key}) : super(key: key);

  @override
  _CategoryLeftRightDemo02PageState createState() =>
      _CategoryLeftRightDemo02PageState();
}

class _CategoryLeftRightDemo02PageState
    extends State<CategoryLeftRightDemo02Page> {
  // 定义左侧分类数据
  List<Map<String, dynamic>> categories = [];
  // 右侧的分类数据
  List<Map<String, dynamic>> rightCategories = [];

  // 当前分类id
  int currentCategory = 0;

  @override
  void initState() {
    super.initState();
    fetchCategoriesData();
  }

  fetchCategoriesData() async {
    Future.delayed(Duration(seconds: 1), () {
      // 先置空一下
      categories = [];
      // 模拟拉取左侧的导航数据
      for (var i = 0; i < 20; i++) {
        var item = {
          "id": i + 1,
          "title": "分类${i + 1}",
          "description": "描述内容",
        };
        // 把item加入到categories中
        categories..add(item);
      }

      // 记得设置分类
      setState(() {
        categories = categories;
        // 加载右侧的数据
        fetchRightCategoriesData(currentCategory);
      });
    });
  }

  fetchRightCategoriesData(int id) {
    // 需要传入左侧菜单的id
    rightCategories = [];
    for (int i = 0; i < id + 5; i++) {
      Map<String, dynamic> item = {
        "id": i + 1,
        "title": "分类$id-右侧菜单${i + 1}",
        "description": "右侧菜单描述${i + 1}"
      };

      rightCategories..add(item);
    }

    // 更新状态
    setState(() {
      rightCategories = rightCategories;
    });
  }

  getLeftWidget() {
    Widget leftWidget;
    if (categories.length <= 0) {
      leftWidget = LoadingWidget(
        imageWidth: 20,
      );
      return leftWidget;
    } else {
      // 左侧内容
      leftWidget = ListView.builder(
        itemBuilder: (context, index) {
          Map<String, dynamic> category = categories[index];
          // 分类组件，上面是标题，下面有个分割线
          Widget categoryWidget;

          // 是否是当前分类
          if (index == currentCategory) {
            categoryWidget = Container(
              width: ScreenAdapter.setWidth(100),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // 包裹Category外面的Container
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                    child: Container(
                      width: ScreenAdapter.setWidth(90),
                      padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.setWidth(10),
                        2,
                        ScreenAdapter.setWidth(5),
                        2,
                      ),
                      margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 3, color: AppPrimaryColor),
                        ),
                      ),
                      child: Text(
                        category["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          // color: AppPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1),
                ],
              ),
            );
          } else {
            categoryWidget = Container(
              width: ScreenAdapter.setWidth(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // 包裹Category外面的Container
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(5)),
                    child: Container(
                      width: ScreenAdapter.setWidth(90),
                      padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.setWidth(12),
                        2,
                        ScreenAdapter.setWidth(5),
                        2,
                      ),
                      margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      child: Text(
                        category["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1),
                ],
              ),
            );
          }

          return InkWell(
            onTap: () {
              // print("分类$index被点击了");
              setState(() {
                currentCategory = index;
                fetchRightCategoriesData(index);
              });
            },
            child: categoryWidget,
          );
        },
        itemCount: categories.length,
      );
    }
    // 返回
    return leftWidget;
  }

  Widget getRightWidget() {
    // 获取右侧的内容
    Widget rightWidget;

    // 判断是否有右侧菜单
    if (rightCategories.length <= 0) {
      rightWidget = Center(
        child: Text("右侧内容"),
      );
    } else {
      // 网格布局，还是浮动布局
      Widget listView = ListView.builder(
        itemBuilder: (context, index) {
          var item = rightCategories[index];
          return ListTile(
            // leading: Icon(Icons.arrow_right),
            title: Text("${item["title"]}"),
          );
        },
        itemCount: rightCategories.length,
      );

      rightWidget = Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
        child: listView,
      );
    }
    // 返回
    return rightWidget;
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenAdapter.init(context);

    // 左侧、右侧内容
    Widget leftWidget, rightWidget;

    // 左侧类容
    leftWidget = getLeftWidget();

    // 右侧内容
    rightWidget = getRightWidget();

    // 页面主体内容
    Widget body = Container(
      color: Colors.white,
      child: Row(
        // 左侧
        children: [
          Container(
            width: ScreenAdapter.setWidth(100),
            height: double.infinity,
            child: leftWidget,
            color: Colors.grey[200],
          ),

          // 右边
          Expanded(
            child: Container(
              height: double.infinity,
              // color: Colors.grey[200],
              child: rightWidget,
            ),
          ),
        ],
      ),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("左右布局02"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}
