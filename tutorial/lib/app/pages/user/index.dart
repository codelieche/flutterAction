/**
 * 用户中心页
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 用户首页
class UserIndexPage extends StatefulWidget {
  @override
  _UserIndexPageState createState() => _UserIndexPageState();
}

class _UserIndexPageState extends State<UserIndexPage> {

  @override
  Widget build(BuildContext context) {
    CustomScrollView scrollView = CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150,  // 期待的高度
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppPrimaryColor, AppPrimaryColor,],
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 0.4),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 20
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage('http://static.codelieche.com/docs/images/2020/07/07152218_0.png'),
                        child: Text(
                          "codelieche",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30, right: 10),
                              child: Text(
                                "codelieche",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Text(
                              "每天进步一点点...",
                              style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate:  SliverChildListDelegate(
            [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _InfoItem(category: "gitflow", name: "代码工作流", count: 500),
                      _InfoItem(category: "dbflow", name: "数据库工作流", count: 60),
                      _InfoItem(category: "cronjob", name: "计划任务", count: 160),
                    ],
                  ),
                ),
              ),
            ]
          ),
        )
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: scrollView,
    );

    return scaffold;
  }
}

class _InfoItem extends StatefulWidget {
  final String category; // 类型
  final String name;     // 显示的名字
  final int count;       // 数量

  // 构造函数
  _InfoItem({Key key, this.category="default", this.name="类别", this.count=0}):super(key: key);

  @override
  __InfoItemState createState() => __InfoItemState();
}

class __InfoItemState extends State<_InfoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("on tap");
        showDialog(
            context: context,
            child: AlertDialog(
                      content: Text(widget.name),
            )
        );
      },
      child: Container(
        // color: Colors.red,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Container(
                child: Text(
                  widget.count.toString(),
                  style: TextStyle(
                    color: AppPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

