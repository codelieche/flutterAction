// 相机页面
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCamaraDemoPage extends StatefulWidget {
  ImagePickerCamaraDemoPage({Key key}) : super(key: key);

  @override
  _ImagePickerCamaraDemoPageState createState() =>
      _ImagePickerCamaraDemoPageState();
}

class _ImagePickerCamaraDemoPageState extends State<ImagePickerCamaraDemoPage> {
  // ImagePicker实例
  ImagePicker picker = ImagePicker();
  // 图片
  List<File> imagesList = [];

  getImageFromCamara() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 400);
    print(pickedFile.path);
    // 修改状态
    setState(() {
      imagesList = [...imagesList, File(pickedFile.path)];
    });
  }

  @override
  Widget build(BuildContext context) {
    // 渲染图片元素
    var imagesContainers = imagesList.map((item) {
      print(item);
      return Container(
        padding: EdgeInsets.all(5),
        child: Image.file(item),
      );
    });

    // 主体内容
    Widget body = ListView(
      children: [
        ...imagesContainers,
        // 按钮
        // Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         padding: EdgeInsets.all(5),
        //         child: RaisedButton(
        //           onPressed: this.getImageFromCamara,
        //           child: Text("打开相机"),
        //         ),
        //       ),
        //     )
        //   ],
        // )
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("相机"),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
        onPressed: this.getImageFromCamara,
      ),
    );

    // 返回
    return scaffold;
  }
}
