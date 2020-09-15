// 选择相册
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPhotoDemoPage extends StatefulWidget {
  ImagePickerPhotoDemoPage({Key key}) : super(key: key);

  @override
  _ImagePickerPhotoDemoPageState createState() =>
      _ImagePickerPhotoDemoPageState();
}

class _ImagePickerPhotoDemoPageState extends State<ImagePickerPhotoDemoPage> {
  // ImagePicker实例
  ImagePicker picker = ImagePicker();
  // 图片
  List<File> imagesList = [];

  getImageFromPhoto() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, maxWidth: 400);
    print(pickedFile.path);
    // 修改状态
    setState(() {
      imagesList = [...imagesList, File(pickedFile.path)];
    });
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView.builder(
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Image.file(imagesList[index]),
          );
        });
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("相册"),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.add),
        onPressed: this.getImageFromPhoto,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );

    // 返回
    return scaffold;
  }
}
