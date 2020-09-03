import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 四个Container组件
var fourContainer = [
  // 容器1：高 150
  Expanded(
      child: Container(
    height: 150,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.grey[400],
      border: Border.all(color: AppPrimaryColor, width: 1.0),
    ),
  )),

  // 容器2：高 100
  Expanded(
      child: Container(
    height: 100,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.lightBlue[400],
      border: Border.all(color: AppPrimaryColor, width: 1.0),
    ),
  )),

  // 容器3：高 50
  Expanded(
      child: Container(
    height: 50,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.pinkAccent[400],
      border: Border.all(color: AppPrimaryColor, width: 1.0),
    ),
  )),

  // 容器4：高 125
  Expanded(
      child: Container(
    height: 125,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.purpleAccent[400],
      border: Border.all(color: AppPrimaryColor, width: 1.0),
    ),
  )),
];

// 三个方形
var threeSquareContainer = [
  Container(
    width: 50,
    height: 50,
    color: Colors.grey[400],
    alignment: Alignment.center,
    child: Text("1"),
  ),
  Container(
    width: 50,
    height: 50,
    color: Colors.lightBlue[400],
    alignment: Alignment.center,
    child: Text("2"),
  ),
  Container(
    width: 50,
    height: 50,
    color: Colors.purpleAccent[400],
    alignment: Alignment.center,
    child: Text("3"),
  )
];
