import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class UserCenterDemo02 extends StatefulWidget {
  UserCenterDemo02({Key key}) : super(key: key);

  @override
  _UserCenterDemo02State createState() => _UserCenterDemo02State();
}

class _UserCenterDemo02State extends State<UserCenterDemo02> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                // color: Colors.pink[400],
                color: AppPrimaryColor,
                child: Row(
                  children: [
                    Container(
                      // width: 100,
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipOval(
                        child: Container(
                          width: 60,
                          height: 60,
                          // child: Image.asset(
                          //   "asserts/images/codelieche-logo-blue.png",
                          //   width: 70,
                          //   height: 70,
                          // ),
                          alignment: Alignment.center,
                          child: Icon(
                            CupertinoIcons.person_alt,
                            color: Colors.grey[400],
                            size: 35,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "用户名：codelieche",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(
                                "管理员",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // 一条分割线
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                height: 10,
              ),
            )
          ],
        ),

        ListTile(
          leading: Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          title: Text("我的订单"),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.stars,
            color: Colors.orange,
          ),
          title: Text("我的收藏"),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.shop_two,
            color: Colors.purpleAccent,
          ),
          title: Text("收货地址"),
        ),

        // 一条分割线
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                height: 10,
              ),
            )
          ],
        ),

        ListTile(
          leading: Icon(
            Icons.message,
            color: Colors.green,
          ),
          title: Text("消息中心"),
        ),

        Divider(),
        ListTile(
          leading: Icon(
            Icons.photo,
            color: Colors.pinkAccent,
          ),
          title: Text("我的照片"),
        ),

        // 一条分割线
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                height: 10,
              ),
            )
          ],
        ),

        // 退出登录
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {},
                  color: AppPrimaryColor,
                  textColor: Colors.white,
                  child: Text("退出登录"),
                ),
              ),
            )
          ],
        )
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: SingleChildScrollView(
        child: body,
      ),
    );

    // 返回
    return scaffold;
  }
}
