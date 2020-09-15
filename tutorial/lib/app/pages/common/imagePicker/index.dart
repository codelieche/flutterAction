// 使用相机/照片
// 参考文档：https://pub.flutter-io.cn/packages/image_picker

// bottomNavigationBar
// 常见的属性
// items: List<BottomNavigationBarItem> 底部导航条按钮集合
// iconSize：icon的大小
// currentIndex: 默认选中第几个
// onTap：选中变化回调函数
// fixedColor: 选中颜色
// type：BottomNavigationBarType.fixed/shifting
import 'package:flutter/material.dart';

// 引入页面
import './camara.dart';
import './photo.dart';

class ImagePickerIndexPage extends StatefulWidget {
  ImagePickerIndexPage({Key key}) : super(key: key);

  @override
  _ImagePickerIndexPageState createState() => _ImagePickerIndexPageState();
}

class _ImagePickerIndexPageState extends State<ImagePickerIndexPage> {
  int _currentBarIndex = 0; // 当前选中的导航bar
  List<Widget> _bodyPages = []; // 导航bar对应的页面
  @override
  void initState() {
    super.initState();

    // app的初始页面
    _bodyPages = [
      ImagePickerCamaraDemoPage(),
      ImagePickerPhotoDemoPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 底部导航
    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      currentIndex: _currentBarIndex, // 当前选中的bar
      items: [
        // 底部导航的tab选项
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), title: Text("相机")),
        BottomNavigationBarItem(icon: Icon(Icons.photo), title: Text("相册")),
      ],
      onTap: (index) {
        // 切换底部导航
        setState(() {
          // 设置选中的导航bar
          _currentBarIndex = index;
        });
      },
      iconSize: 24.0, // 图标icon的大小,
      selectedFontSize: 12, // 选中的文字大小，默认是14
      unselectedFontSize: 12, // 为选中的文字大小，默认是12
      fixedColor: Colors.pinkAccent, // 选中的bar颜色
      type: BottomNavigationBarType.fixed, // 配置底部bars可以有多个按钮
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: _bodyPages[_currentBarIndex],
      bottomNavigationBar: bottomNavigationBar, // 底部导航
    );

    // 返回
    return scaffold;
  }
}
