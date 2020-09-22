import 'package:flutter/material.dart';

import "./lianxi001_detail.dart";

// color
Color _kPrimaryColor = Color.fromRGBO(11, 157, 62, 1);

class Lianxi001DemoPage extends StatefulWidget {
  Lianxi001DemoPage({Key key}) : super(key: key);

  @override
  _Lianxi001DemoPageState createState() => _Lianxi001DemoPageState();
}

class _Lianxi001DemoPageState extends State<Lianxi001DemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = _Body();

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(71, 140, 95, 1),
        backgroundColor: _kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: body,
      bottomNavigationBar: _BottomNavigationBar(),
    );
    // 返回
    return scaffold;
  }
}

class _Body extends StatefulWidget {
  _Body({Key key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 头部和搜索
          _HeaderAndSerch(size: size),
          _TitleWithButton(
            title: "热销",
            onPress: () {},
          ),
          _GoodsList(),
          _TitleWithButton(
            title: "推荐",
            onPress: () {},
          ),
          _GoodsList2(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _GoodsList2 extends StatelessWidget {
  const _GoodsList2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _GoodsItem2(image: "asserts/images/codelieche-blue.png"),
          _GoodsItem2(image: "asserts/images/codelieche-logo-blue.png"),
          _GoodsItem2(image: "asserts/images/codelieche-blue.png"),
        ],
      ),
    );
  }
}

class _GoodsItem2 extends StatelessWidget {
  final String image;
  const _GoodsItem2({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      width: size.width * 0.6,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
    );
  }
}

class _GoodsList extends StatelessWidget {
  const _GoodsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _GoodsItem(
            title: "编程列车",
            subTitle: "codelieche",
            price: 19,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Lianxi001DetailPage();
                }),
              );
            },
          ),
          _GoodsItem(
            title: "编程列车",
            subTitle: "codelieche",
            price: 59,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Lianxi001DetailPage();
                }),
              );
            },
          ),
          _GoodsItem(
            title: "编程列车",
            subTitle: "codelieche",
            price: 69,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Lianxi001DetailPage();
                }),
              );
            },
          ),
          _GoodsItem(
            title: "编程列车",
            subTitle: "codelieche",
            price: 99,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Lianxi001DetailPage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _GoodsItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final double price;
  final Function onPress;
  const _GoodsItem({
    Key key,
    this.image = "asserts/images/codelieche-blue.png",
    this.title,
    this.subTitle,
    this.price,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 50,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 150,
            child: Image.asset(image),
          ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: _kPrimaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${this.title}\n",
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: this.subTitle,
                          style: TextStyle(
                            color: _kPrimaryColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\￥ ${this.price}",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: _kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TitleWithButton extends StatelessWidget {
  final String title;
  final Function onPress;
  const _TitleWithButton({Key key, this.title, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _TitleWithCustomUnderline(title: this.title),
          Spacer(), // 中间填充空间
          FlatButton(
            color: _kPrimaryColor,
            onPressed: this.onPress,
            child: Text(
              "更多",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}

class _TitleWithCustomUnderline extends StatelessWidget {
  final String title;
  const _TitleWithCustomUnderline({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 4,
              color: _kPrimaryColor.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}

// 头部
class _HeaderAndSerch extends StatelessWidget {
  const _HeaderAndSerch({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 36),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 56),
            height: size.height * 0.2 - 25,
            decoration: BoxDecoration(
              color: _kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Hi, codelieche!",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("asserts/images/codelieche-logo-blue.png"),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: _kPrimaryColor.withOpacity(0.28),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "搜索一下",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: _kPrimaryColor.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: _kPrimaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: _kPrimaryColor.withOpacity(0.28),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
