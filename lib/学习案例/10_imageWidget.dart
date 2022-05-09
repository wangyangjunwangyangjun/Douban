import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础的Widget"),
      ),
      body: ImageDemo02(),
    );
  }
}

class ImageDemo01 extends StatefulWidget {
  @override
  State<ImageDemo01> createState() => _ImageDemo01State();
}

class _ImageDemo01State extends State<ImageDemo01> {
  final _imageURL = "https://img.zcool.cn/community/01ad5d57d418eb0000018c1b65ed20.jpg@1280w_1l_2o_100sh.jpg";

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(_imageURL),
      width: 200,
      height: 200,
      //宽度为200，高度自适应
      fit: BoxFit.contain,
      //矩形框最左上角为（-1，-1），最右下角为（1,1），中间为（0.0）
      alignment: Alignment(0,0),
      color: Colors.green,
      colorBlendMode: BlendMode.colorDodge,
      repeat: ImageRepeat.repeatY,
    );
  }
}

class ImageDemo02 extends StatefulWidget {
  @override
  State<ImageDemo02> createState() => _ImageDemo02State();
}

class _ImageDemo02State extends State<ImageDemo02> {
  @override
  Widget build(BuildContext context) {
    // return Image(
    //   // 1、创建文件夹存储图片
    //   // 2、在pubspec.yaml进行配置
    //   // 3、使用图片
    //     image: AssetImage("assets/images/test.jpg")
    // );
    return Image.asset("assets/images/test.jpg");
  }
}