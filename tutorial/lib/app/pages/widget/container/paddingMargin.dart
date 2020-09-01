// Container的padding and margin
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class ContainerPaddingMarginDemo extends StatelessWidget {
  const ContainerPaddingMarginDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_drop_down),
          title: Text("padding"),
        ),
        Divider(),
        Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            Container(
              color: AppPrimaryColor,
              child: Text("default"),
            ),
            Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(10),
              child: Text("padding: 10"),
            ),
            Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text("left:10, top: 20"),
            ),
            Container(
              color: AppPrimaryColor,
              padding: EdgeInsets.only(bottom: 15),
              child: Text("bottom:15"),
            ),
            Container(
              color: Colors.deepPurpleAccent,
              // margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
              child: Text("fromLTRB: 10, 15, 10, 5"),
            ),
          ],
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.arrow_drop_down),
          title: Text("margin"),
        ),
        Divider(),
        Row(
          children: [
            Container(
              color: Colors.purpleAccent,
              padding: EdgeInsets.all(5),
              child: Text("noo margin"),
            ),
            Container(
              color: Colors.lightBlue,
              padding: EdgeInsets.all(5),
              child: Text("no margin"),
            ),
            Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(5),
              child: Text("no margin"),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Container(
              color: Colors.purpleAccent,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text("margin: 5"),
            ),
            Container(
              color: Colors.lightBlue,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text("margin: 5"),
            ),
            Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Text("margin: 5"),
            ),
          ],
        ),
        Divider(),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("padding/margin"),
      ),
      body: body,
    );
  }
}
