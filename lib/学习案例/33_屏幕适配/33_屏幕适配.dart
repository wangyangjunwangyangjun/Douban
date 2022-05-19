import 'package:flutter/material.dart';
import './shared/size_fit.dart';
import './extension/double_extension.dart';
import './extension/int_extension.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, splashColor: Colors.transparent),
        home: HYHomePage());
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // // 手机分辨率大小（逻辑分辨率）
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // print("height:$height");
    // print("width:$width");

    print(HYSizeFit.screenHeight);

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.px,
        height: 200.px,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 20.px),
        ),
      ),
    );
  }
}
