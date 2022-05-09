import 'package:flutter/material.dart';

//只有一句代码就可以使用箭头函数
main() => runApp(MyApp());

//Widget分为有状态和无状态
//有状态是运行过程中有一些状态需要改变
//无状态则是内容无需改变
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(debugShowCheckedModeBanner: false, home: HYHomePage());
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("标题"),
        ),
        body: HYContentBody());
  }
}

class HYContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Text(
      "Hello World",
      style: TextStyle(fontSize: 30, color: Colors.orange),
    ));
  }
}
