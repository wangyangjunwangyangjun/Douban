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
      body: IconExtension(),
    );
  }
}

class ButtonExtension extends StatefulWidget {
  const ButtonExtension({Key? key}) : super(key: key);

  @override
  State<ButtonExtension> createState() => _ButtonExtensionState();
}

class _ButtonExtensionState extends State<ButtonExtension> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: 30,
          height: 10,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {},
            child: Text("Flate Button"),
            textColor: Colors.white,
          ),
        )
      ],
    );
  }
}

class ImageExtensionDemo extends StatefulWidget {
  @override
  State<ImageExtensionDemo> createState() => _ImageExtensionDemoState();
}

class _ImageExtensionDemoState extends State<ImageExtensionDemo> {
  final String _imageURL =
      "https://img.zcool.cn/community/01ad5d57d418eb0000018c1b65ed20.jpg@1280w_1l_2o_100sh.jpg";

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        fadeOutDuration: Duration(milliseconds: 1000),
        fadeInDuration: Duration(milliseconds: 1000),
        placeholder: AssetImage("assets/images/test.jpg"),
        image: NetworkImage(_imageURL));
  }
}

class IconExtension extends StatefulWidget {
  const IconExtension({Key? key}) : super(key: key);

  @override
  State<IconExtension> createState() => _IconExtensionState();
}

class _IconExtensionState extends State<IconExtension> {
  @override
  Widget build(BuildContext context) {
    // 1、矢量图放大不失真
    // 字体图标可以设置颜色
    // 图标很多时，占据空间小
    // return Icon(Icons.pets, size: 300, color: Colors.orange,);
    // return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    //传入unicode编码
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: 'MaterialIcons'));
  }
}
