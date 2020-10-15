// CheckBoxListTile的基本使用
// 比CheckBox多title、subtitle、sencodary、selected等属性
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class CheckBoxListTileBaseDemoPage extends StatefulWidget {
  CheckBoxListTileBaseDemoPage({Key key}) : super(key: key);

  @override
  _CheckBoxListTileBaseDemoPageState createState() =>
      _CheckBoxListTileBaseDemoPageState();
}

class _CheckBoxListTileBaseDemoPageState
    extends State<CheckBoxListTileBaseDemoPage> {
  String name;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // Checkbox
        SimpleTitleWidget(title: "Checkbox"),
        Wrap(
          children: [
            Checkbox(
              activeColor: Colors.pinkAccent,
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
            ),
            Checkbox(
              activeColor: Colors.pinkAccent,
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
            )
          ],
        ),

        // 基本使用
        SimpleTitleWidget(
          title: "CheckboxListTile",
          description: "比CheckBox多title、subtitle、sencodary、selected等属性",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
            ),
            CheckboxListTile(
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
            )
          ],
        ),

        // CheckBoxListTile: 设置title
        SimpleTitleWidget(
          title: "CheckboxListTile",
          description: "设置title",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
              title: Text("codelieche"),
            ),
            CheckboxListTile(
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
            )
          ],
        ),

        // CheckBoxListTile: 设置subtitle
        SimpleTitleWidget(
          title: "设置subtitle",
          description: "subtitle",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
              title: Text("codelieche"),
              subtitle: Text("codelieche.com"),
            ),
            CheckboxListTile(
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
            )
          ],
        ),

        // CheckBoxListTile: 设置activecolor
        SimpleTitleWidget(
          title: "设置activecolor",
          description: "activeColor: Colors.pinkAccent",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              value: this.name == "codelieche",
              activeColor: Colors.pinkAccent,
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
              title: Text("codelieche"),
              subtitle: Text("codelieche.com"),
            ),
            CheckboxListTile(
              value: this.name == "编程列车",
              activeColor: Colors.pinkAccent,
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
            )
          ],
        ),

        // CheckBoxListTile: 设置secondary
        SimpleTitleWidget(
          title: "设置secondary",
          description: "secondary: Widget",
        ),
        Wrap(
          children: [
            CheckboxListTile(
                dense: true,
                value: this.name == "codelieche",
                activeColor: Colors.pinkAccent,
                onChanged: (checked) {
                  if (checked) {
                    setState(() {
                      name = "codelieche";
                    });
                  }
                },
                title: Text("codelieche"),
                subtitle: Text("codelieche.com"),
                secondary: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Text("Logo"),
                  ),
                )),
            CheckboxListTile(
              dense: true,
              value: this.name == "编程列车",
              activeColor: Colors.pinkAccent,
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
              secondary: Image.asset("asserts/images/codelieche-logo-blue.png"),
            )
          ],
        ),

        // CheckBoxListTile: 设置selected
        SimpleTitleWidget(
          title: "设置selected",
          description: "selected: false(默认)/true",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              dense: true,
              value: this.name == "codelieche",
              activeColor: Colors.pinkAccent,
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
              title: Text("codelieche"),
              subtitle: Text("codelieche.com"),
              secondary: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Text("Logo"),
                ),
              ),
              selected: this.name == "codelieche",
            ),
            CheckboxListTile(
              dense: true,
              value: this.name == "编程列车",
              activeColor: Colors.pinkAccent,
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
              secondary: Image.asset("asserts/images/codelieche-logo-blue.png"),
              selected: this.name == "编程列车",
            )
          ],
        ),
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxListTile"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}
