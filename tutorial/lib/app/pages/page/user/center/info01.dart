import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCenterInfoDemo01 extends StatefulWidget {
  UserCenterInfoDemo01({Key key}) : super(key: key);

  @override
  _UserCenterInfoDemo01State createState() => _UserCenterInfoDemo01State();
}

class _UserCenterInfoDemo01State extends State<UserCenterInfoDemo01> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // 主体内容
    Widget body = Container(
      width: size.width,
      // color: Color.fromRGBO(220, 220, 220, .3),
      // color: Colors.white,
      child: Container(
        height: size.height - 100,
        child: Column(
          children: [
            // 头像
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(),
                    width: 100,
                    child: Text("头像"),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(right: 5),
                        child: ClipOval(
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.grey[200],
                            // child: Image.asset(
                            //   "asserts/images/codelieche-logo-blue.png",
                            //   width: 40,
                            //   height: 40,
                            // ),
                            child: Icon(
                              CupertinoIcons.person_alt,
                              color: Colors.grey[400],
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            // 昵称
            _UserInfoDisplay(title: "昵称", value: "madeinlife"),

            // 性别
            _UserInfoDisplay(title: "性别", value: "男"),

            // 邮箱
            _UserInfoDisplay(title: "邮箱", value: "admin@codelieche.com"),

            // 手机号
            _UserInfoDisplay(title: "手机号", value: "123456789"),
            SizedBox(height: 10),

            // 描述
            _UserInfoDisplay(title: "个人简介", value: "个人简介"),
            _UserInfoDisplay(
              title: "系统角色",
              value: "管理员",
              borderBottomWidth: 0.5,
            ),
          ],
        ),
      ),
    );

    // 包裹滑动
    body = SingleChildScrollView(
      child: body,
      physics: AlwaysScrollableScrollPhysics(),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.black87,
            ),
        textTheme: Theme.of(context).textTheme.copyWith(),
        title: Text(
          "个人信息",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            // color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: body,
      backgroundColor: Colors.grey[100],
    );

    // 返回
    return scaffold;
  }
}

class _UserInfoDisplay extends StatelessWidget {
  final String title;
  final String value;
  final double borderBottomWidth;
  const _UserInfoDisplay({
    Key key,
    @required this.title,
    @required this.value,
    this.borderBottomWidth = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width,
      // margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(),
            width: 100,
            child: Text("$title"),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                height: 35,
                margin: EdgeInsets.only(right: 5),
                alignment: Alignment.centerRight,
                child: Text("$value"),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: borderBottomWidth > 0
                ? BorderSide(
                    width: borderBottomWidth,
                    color: Colors.grey[300],
                  )
                : BorderSide.none,
          )),
    );
  }
}
